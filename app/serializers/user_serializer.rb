class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :username , :password, :user_picture
  has_many :favorites
end
