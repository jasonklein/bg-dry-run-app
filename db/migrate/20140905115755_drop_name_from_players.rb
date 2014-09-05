class DropNameFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :name
  end
end
