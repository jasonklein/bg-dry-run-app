class AddTagTimeToClips < ActiveRecord::Migration
  def change
    add_column :clips, :tag_time, :time
  end
end
