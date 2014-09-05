class AddPlayerIdToClips < ActiveRecord::Migration
  def change
    add_column :clips, :player_id, :integer
    add_index :clips, :player_id
  end
end
