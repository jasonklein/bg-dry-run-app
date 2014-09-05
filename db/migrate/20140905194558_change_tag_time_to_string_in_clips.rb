class ChangeTagTimeToStringInClips < ActiveRecord::Migration
  def change
    change_column :clips, :tag_time, :string
  end
end
