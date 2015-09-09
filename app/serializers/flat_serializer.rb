class FlatSerializer < ActiveModel::Serializer
  attributes :floor_plan_id, :numbers, :image_url

  def image_url
  	object.fp_url
  end
end