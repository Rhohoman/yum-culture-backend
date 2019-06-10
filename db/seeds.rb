# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

require 'rest-client'
require 'JSON'

User.destroy_all
Food.destroy_all

# 50.times do 
#     Food.create([{
#         name: Faker::Food.dish,
#         image: null,
#         description: Faker::Food.description,
#         calories: rand(200..1000),
#         rating: rand(1-5),
#     }])
# end


# request the information from the api here and take the response and create the seeds


#here I want to fetch all the categories data 

# List all meal categories
# https://www.themealdb.com/api/json/v1/1/categories.php
# categories_array = []

# after I get all the categories I put it into an array and then I can use that array to interpolate by iterating through every category
# and then interpolate into the next fetch which is by category

# categories_array.map(category =>  fetch )

# Filter by Category
# https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood

# by getting back all the result from each category


category_data = RestClient.get('https://www.themealdb.com/api/json/v1/1/categories.php')
parsed_category_data = JSON.parse(category_data)
category_types = parsed_category_data["categories"].map{|category| category['strCategory']}

all_food_items_by_category = []
category_types.each{ |category_type| 
    food_data = RestClient.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category_type}")
    parsed_food_data = JSON.parse(food_data)
    all_food_items_by_category << parsed_food_data
}
# all_food_items = new_array.map{ |category_type|  RestClient.get(`https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category_type}`) }

all_food_items = []
all_food_items_by_category.each{ |category| category['meals'].each{ |meal| all_food_items << meal} }


all_meals_unformatted = []
all_food_items.each{ |meal|

    meal_object = RestClient.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal['idMeal']}")
    parsed_meal_object = JSON.parse(meal_object)
    all_meals_unformatted << parsed_meal_object
}

sorted_meals = []
all_meals_unformatted.each{ |meal_object| meal_object['meals'].each{ |meal| sorted_meals << meal } }

# all_food_items.each{ |meal|
#     meal_id = meal['idMeal']
#     print "id: #{meal_id}, "
# }

# Food.create(
#         name: meal['strMeal'],
#         image: meal['strMealThumb'],
#         description: "",
#         calories: null,
#         categories: null,
#         api_id: meal['idMeal']
#     )
binding.pry

# RestClient.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood')