class Match < ActiveRecord::Base
  attr_accessible :video, :name


  has_many :clips
  has_one :video
  
end
