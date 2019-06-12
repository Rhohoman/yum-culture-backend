class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :username , :password
  has_many :favorites
end
