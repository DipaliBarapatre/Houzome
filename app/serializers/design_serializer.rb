class DesignSerializer < ActiveModel::Serializer
  attributes :name, :image_url, :slug, :description, :specifications, :selling_price

  def image_url
  	object.master_image_url
  end
end