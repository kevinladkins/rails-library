class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_name, :last_name
  has_many :books
end
