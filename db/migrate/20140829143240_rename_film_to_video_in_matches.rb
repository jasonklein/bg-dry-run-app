class RenameFilmToVideoInMatches < ActiveRecord::Migration
  def change
    rename_column :matches, :film, :video
  end
end
