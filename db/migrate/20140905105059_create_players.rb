class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :upi
      t.string :first_name
      t.string :last_name
      t.references :match
      t.string :name

      t.timestamps
    end
    add_index :players, :match_id
  end
end
