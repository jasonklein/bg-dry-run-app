class AddBaseModuleIdToClips < ActiveRecord::Migration
  def change
    add_column :clips, :base_module_id, :integer
    add_index :clips, :base_module_id
  end
end
