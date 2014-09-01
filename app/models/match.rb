class Match < ActiveRecord::Base
  attr_accessible :name, :play_date, :videos_attributes


  has_many :clips
  has_many :videos

  accepts_nested_attributes_for :videos

end
