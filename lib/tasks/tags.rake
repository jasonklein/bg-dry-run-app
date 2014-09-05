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
            clip.save
          end
        else
          return
        end
      end 
    end
    bm.update_attributes(report_run: true)
  end
end