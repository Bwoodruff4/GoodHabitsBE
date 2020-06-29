class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :habits
end