class AddFilmToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :film, :string
  end
end
