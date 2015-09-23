class User < ActiveRecord::Base
  has_many :songs
  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true, length: {in: 6..100}
  validates :password, presence: true, length: {minimum: 6}
end