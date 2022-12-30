class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers
  include RatingAverage
  validates :name, presence: true, allow_blank: false
  validates :year, numericality: { greater_than_or_equal_to: 1040,
                                   less_than_or_equal_to: 2022,
                                   only_integer: true }

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2022
    puts "changed year to #{year}"
  end
end
