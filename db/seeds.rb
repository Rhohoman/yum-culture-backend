# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Food.destroy_all

# user1 = User.create( name:'John Doe', location:'New York', username: 'Jonny')



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