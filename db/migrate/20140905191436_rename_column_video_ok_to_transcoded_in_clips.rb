class RenameColumnVideoOkToTranscodedInClips < ActiveRecord::Migration
  def change
    rename_column :clips, :video_ok, :transcoded
  end
end
