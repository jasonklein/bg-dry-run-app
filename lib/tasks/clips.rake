desc "Update clips where transcoding is complete"
task :clips => :environment do
  Clip.unavailable.each do |clip|
    url = clip.url
    aws_response = HTTParty.get url
    if aws_response.code == 200
      clip.update_attributes(transcoded: true)
      puts "Clip for #{clip.player.upi} at or around #{clip.tag_time} has been transcoded."
    else
      puts "Clip for #{clip.player.upi} at or around #{clip.tag_time} has not yet been transcoded."
    end
  end
end