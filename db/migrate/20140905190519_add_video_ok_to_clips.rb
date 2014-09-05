class AddVideoOkToClips < ActiveRecord::Migration
  def change
    add_column :clips, :video_ok, :boolean, default: false
  end
end
