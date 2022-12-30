class User < ApplicationRecord
  include RatingAverage
  has_secure_password
  validates :password, length: { minimum: 4 },
                       format: { with: /[A-Z]+/, message: "must include at least one uppercase letter" },
                       format: { with: /\d+/, message: "must include at least one number" }
  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 30 }

  has_many :beers, through: :ratings
  has_many :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships
  attr_accessor :deleted_at
end

class Rating < ApplicationRecord
  belongs_to :beer
  belongs_to :user   # rating kuuluu myös käyttäjään

  def to_s
    "#{beer.name} #{score}"
  end

  def average
    return unless ratings.count == 0

    0
  end
end
