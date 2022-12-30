class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :beer_club

  def to_s
    "tekstiesitys"
  end

  def new
    @membership = Membership.new
  end
end
