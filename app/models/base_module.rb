class BaseModule < ActiveRecord::Base
  belongs_to :match
  attr_accessible :name, :report, :match_id

  validates :name, :report, :match_id, presence: true

  mount_uploader :report, ReportUploader

  def tags
    tags_meta_array = self.tags_meta_array
    rejoined_tags = []
    tags_meta_array.each do |split_tag|
      rejoined_tags << split_tag.join(" ")
    end
    rejoined_tags
  end

  def tags_meta_array
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
end
