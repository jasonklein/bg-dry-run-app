class Match < ActiveRecord::Base
  attr_accessible :name, :play_date, :videos_attributes, :players_attributes


  has_many :clips, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :base_modules, dependent: :destroy

  accepts_nested_attributes_for :videos
  accepts_nested_attributes_for :players

end
