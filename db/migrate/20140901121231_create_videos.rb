class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :match
      t.string :location
      t.string :container
      t.float :duration
      t.datetime :creation_time
      t.integer :bitrate
      t.string :video_stream
      t.string :audio_stream
      t.string :video_codec
      t.string :audio_channels
      t.integer :audio_sample_rate
      t.integer :width
      t.integer :height

      t.timestamps
    end
    add_index :videos, :match_id
  end
end
