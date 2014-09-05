class RenameVideoToUrlInClips < ActiveRecord::Migration
  def change
    rename_column :clips, :video, :url
  end
end
