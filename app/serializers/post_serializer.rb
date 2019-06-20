class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :food_id, :text, :likes, :dislikes, :username, :foodName, :image_url, :profile_image_url
end
