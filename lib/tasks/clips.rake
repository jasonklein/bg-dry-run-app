desc "Update clips where transcoding is complete"
task :clips => :environment do
  Clip.unavailable.each do |clip|
    url = clip.url
    aws_response = HTTParty.get url
    clip.update_attributes(transcoded: true) if aws_response.code == 200
  end
end