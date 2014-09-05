class Player < ActiveRecord::Base
  belongs_to :match

  has_many :clips
  attr_accessible :first_name, :last_name, :name, :upi
end
