class CreateBaseModules < ActiveRecord::Migration
  def change
    create_table :base_modules do |t|
      t.string :name
      t.string :report
      t.references :match

      t.timestamps
    end
    add_index :base_modules, :match_id
  end
end
