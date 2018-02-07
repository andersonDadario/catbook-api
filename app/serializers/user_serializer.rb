class UserSerializer < ActiveModel::Serializer 
  attributes :id, :name, :email, :photo_url
end

