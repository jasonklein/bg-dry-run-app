class AddVideoIdToClips < ActiveRecord::Migration
  def change
    add_column :clips, :video_id, :integer
    add_index :clips, :video_id
  end
end
