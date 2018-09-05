class ArticuloSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :contenido
  has_one :user
end
