# == Schema Information
#
# Table name: company_images
#
#  id                :bigint           not null, primary key
#  use_purpose(type) :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :bigint
#  image_id          :bigint
#
# Indexes
#
#  index_company_images_on_company_id               (company_id)
#  index_company_images_on_company_id_and_image_id  (company_id,image_id) UNIQUE
#  index_company_images_on_image_id                 (image_id)
#  index_company_images_on_use_purpose              (use_purpose)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (image_id => images.id)
#
require 'rails_helper'

RSpec.describe CompanyImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
