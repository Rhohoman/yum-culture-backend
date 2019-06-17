class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :food


    def self.favorited_meal
        @favorites = Favorite.all
        # @favorites.group_by(&:itself).map{|k,v| k.merge(count: v.length)}
        
        @favorites.each_with_object(Hash.new(0)) do |element, hash|
            hash[element.name] += 1
        end

        # {
        #     "Beef and Mustard Pie": 4,
        #     "Custard": 1
        # }

    end

    def self.largest_hash_key
        # binding.pry
        self.favorited_meal.max_by{|k,v| v}
    end

end
