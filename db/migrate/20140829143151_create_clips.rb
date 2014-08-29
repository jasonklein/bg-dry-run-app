class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.references :match
      t.string :video

      t.timestamps
    end
  end
end
