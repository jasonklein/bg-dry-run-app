class AddAndRemoveColumnsFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :video
    add_column :matches, :play_date, :datetime
  end
end
