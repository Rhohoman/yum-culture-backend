class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :username
end
