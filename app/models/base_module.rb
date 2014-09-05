class BaseModule < ActiveRecord::Base
  belongs_to :match
  attr_accessible :name, :report, :match_id

  mount_uploader :report, ReportUploader
end
