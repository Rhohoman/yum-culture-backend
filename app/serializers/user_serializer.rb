class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :username , :user_picture
  has_many :favorites
end
