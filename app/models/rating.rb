class Rating < ApplicationRecord
   belongs_to :beer

   def to_s
      "tekstiesitys"
    end
    def new
      @rating = Rating.new
    end
end
