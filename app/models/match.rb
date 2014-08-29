class Match < ActiveRecord::Base
  attr_accessible :film, :name

  mount_uploader :film, FilmUploader
end
