class ProjectSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :allocation,
    :detail,
    :main_image
  )


  def main_image
    object.main_image
  end

  belongs_to :company,  serializer: CompanySerializer

end