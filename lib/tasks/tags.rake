require_relative '../helpers/aws_helper'
include AWSHelper

desc "Make clips and transcode via AWS"
task :tags => :environment do
  BaseModule.unrun.each do |bm|
    split_tags = bm.split_tags
    split_tags.each do |split_tag|
      upi = split_tag[0..1].join
      if match = bm.match
        if player = Player.where(upi: upi, match_id: match.id).first
          match.videos.each do |video|
            clip = Clip.new
            clip.video_id = video.id
            clip.match_id = match.id
            clip.player_id = player.id
            clip.base_module_id = bm.id
            clip.tag_time = split_tag[2..3].join " "
            if job = make_transcoded_clip(video, clip.tag_time, upi)[:job]
              clip.url = aws_transcoded_clip_url(clip.match_id, clip.video_id, video.location.path, upi, clip.tag_time)
              clip.save
              puts "Clip for #{upi} at or around #{clip.tag_time} has been saved and a transcode job created: " + JSON.pretty_generate(job)
            else
              puts "Transcode job for #{upi} at or around #{clip.tag_time} has NOT been saved and a transcode job has not been created."
            end
          end
        end
      end 
    end
    bm.update_attributes(report_run: true)
  end
end