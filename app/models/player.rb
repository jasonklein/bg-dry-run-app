class Player < ActiveRecord::Base
  belongs_to :match

  has_many :clips
  attr_accessible :first_name, :last_name, :upi, :match_id

  validates :upi, :first_name, :last_name, presence: true

  def name
    self.first_name + " " + self.last_name    
  end
end
