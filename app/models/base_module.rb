class BaseModule < ActiveRecord::Base
  belongs_to :match
  has_many :clips
  
  attr_accessible :name, :report, :match_id, :report_run

  validates :name, :report, :match_id, presence: true

  mount_uploader :report, ReportUploader

  def tags
    split_tags = self.split_tags
    rejoined_tags = []
    split_tags.each do |split_tag|
      rejoined_tags << split_tag.join(" ")
    end
    rejoined_tags
  end

  def split_tags
    tags_array = self.tags_array
    tags_array.map { |tag| tag.split "," }
  end

  def tags_array
    file = self.get_report
    file.split "\n"
  end

  def get_report
    open(self.report.url).read
  end

  scope :unrun, where(report_run: false)
end
