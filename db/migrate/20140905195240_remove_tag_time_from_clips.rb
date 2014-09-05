class RemoveTagTimeFromClips < ActiveRecord::Migration
  def change
    remove_column :clips, :tag_time
    add_column :clips, :tag_time, :datetime
  end
end
