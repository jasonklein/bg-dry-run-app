class AddCameraNameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :camera_name, :string
  end
end
