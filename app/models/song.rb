class Song < ActiveRecord::Base
  validates :song_title, presence: true, length: {in: 1..100}
  validates :author, presence: true, length: {maximum: 50}
end