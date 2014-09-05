class RenameColumnCameraNameToCameraInVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :camera_name, :camera
  end
end
