class Song < ActiveRecord::Base
  belongs_to :user
  validates :song_title, presence: true, length: {in: 1..100}
  validates :author, presence: true, length: {maximum: 50}
end