class Beer < ApplicationRecord
  include RatingAverage
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user
  validates :name, presence: true, allow_blank: false
  def average
    if ratings.count == 0
      return 0
    end

    ratings.map(&:score).sum / ratings.count.to_f
  end

  def to_s
    "#{name} by #{brewery.name}"
  end
end
