desc "Make clips and transcode via AWS"
task :tags => :environment do
  BaseModule.unrun.each do |bm|
    split_tags = bm.split_tags
    split_tags.each do |split_tag|
      upi = split_tag[0..1].join
      match_id = bm.match_id
      if player = Player.where(upi: upi, match_id: match_id).first
        clip = Clip.new
        clip.match_id = match_id
        clip.player_id = player.id
        clip.base_module_id = bm.id
        clip.tag_time = split_tag[2..3].join " "
        clip.save
      else
        return
      end
    end
    bm.update_attributes(report_run: true)
  end
end