

require 'rest-client'
require 'JSON'

User.destroy_all
Food.destroy_all


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


puts "CATEGORY TYPES DONE"



puts "FEETCH CATEGORY TYPE"

all_food_items_by_category = []
category_types.each{ |category_type| 
    food_data = RestClient.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category_type}")
    parsed_food_data = JSON.parse(food_data)
    all_food_items_by_category << parsed_food_data
}
puts "ALL FOOD ITEMS BY CATEGORY DONE"

# all_food_items = new_array.map{ |category_type|  RestClient.get(`https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category_type}`) }

all_food_items = []
all_food_items_by_category.each{ |category| category['meals'].each{ |meal| all_food_items << meal} }

puts "FETCH MY MEAL ID"

all_meals_unformatted = []
all_food_items.each{ |meal|
    begin

    meal_object = RestClient.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal['idMeal']}")

    rescue => e 

         puts "Error #{e.message}"

    end
    
    parsed_meal_object = JSON.parse(meal_object)
    all_meals_unformatted << parsed_meal_object

}

puts "all_meals_unformatted DONE"


sorted_meals = [] 
all_meals_unformatted.each{ |meal_object| meal_object['meals'].each{ |meal| sorted_meals << meal } }

sorted_meals.each{ |meal| 
    Food.create(
        name: meal['strMeal'],
        image: meal['strMealThumb'],
        categories: "#{meal['strCategory']},#{meal['strTags']}",
        rating: 0,
        api_id: meal['idMeal'],
        youtube_url: meal["strYoutube"],
        area: meal['strArea'],
        instructions: meal['strInstructions']
    )
}
puts "COMPLETE"
# binding.pry

# RestClient.get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood')