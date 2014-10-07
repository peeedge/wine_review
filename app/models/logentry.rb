class Logentry < ActiveRecord::Base
  belongs_to :wine
  RATINGS = 1..5
  validates :name, :comments, presence: true
  validates :comments, length: { minimum: 15 }, unless: 'comments.blank?'
  validates :rating, inclusion: { in: RATINGS, message: "must be from #{RATINGS.first} to #{RATINGS.last}" }
end
