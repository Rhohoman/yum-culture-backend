class Food < ApplicationRecord
    has_many :favorites
    has_many :posts
end
