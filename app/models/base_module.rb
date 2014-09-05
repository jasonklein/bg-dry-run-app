class BaseModule < ActiveRecord::Base
  belongs_to :match
  attr_accessible :name, :report, :match_id

  validates :name, :report, :match_id, presence: true

  mount_uploader :report, ReportUploader
end
