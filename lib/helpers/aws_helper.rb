module AWSHelper
  def aws_pipeline_id
    ENV["EC2_TRANSCODE_PIPELINE_ID_#{Rails.env.upcase}"]
  end

  def aws_region
    "eu-west-1"
  end

  def aws_web_preset_id
    "1351620000001-100070"
  end

  def aws_transcoder_client
    if !@transcoder_client
      @transcoder_client = AWS::ElasticTranscoder::Client.new(region: aws_region)
    end
    @transcoder_client
  end

  def aws_input(input_key)
    { key: input_key }
  end

  def aws_output_key(input_key, upi)
    output_key_suffix = Digest::SHA256.hexdigest(input_key.encode('UTF-8'))[0..10]
    output_key = "bg-clip-#{upi.downcase}-#{output_key_suffix}"
    output_key
  end

  def aws_output_key_prefix(match_id, video_id)
    "elastic-transcoder/output/match/#{match_id}/video/#{video_id}/"
  end

  def aws_output_composition(video, tag_time)
    start_time = tag_time - 5
    creation_time = video.creation_time

    if start_time < creation_time
      start_time = creation_time
    end

    duration = 20
    video_end_time = creation_time + video.duration
    if (start_time + duration) > video_end_time
      start_time = video_end_time - duration
    end

    start_time = (start_time - creation_time).to_s
    duration = duration.to_s

    [{time_span: {start_time: start_time, duration: duration}}]
  end

  def make_transcoded_clip(video, tag_time, upi)
    if tag_time > video.creation_time
      clip_output = {
        key: aws_output_key(video.location.path, upi),
        preset_id: aws_web_preset_id,
        composition: aws_output_composition(video, tag_time)
      }
      outputs = [clip_output]

      aws_transcoder_client.create_job(
        pipeline_id: aws_pipeline_id,
        input: aws_input(video.location.path),
        output_key_prefix: aws_output_key_prefix(video.match_id, video.id),
        outputs: outputs
        )
    else
      return
    end
  end

  def aws_transcoded_clip_url(match_id, video_id, input_key, upi)
    "https://s3-eu-west-1.amazonaws.com/bg-dry-run-#{Rails.env}/#{aws_output_key_prefix(match_id, video_id)}#{aws_output_key(input_key, upi)}"
  end
end