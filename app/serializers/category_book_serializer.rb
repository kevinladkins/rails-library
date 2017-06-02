class CategoryBookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :author_id

  def author
    object.author.name
  end

  def author_id
    object.author.id
  end

end
