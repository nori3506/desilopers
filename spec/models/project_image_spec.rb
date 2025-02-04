# == Schema Information
#
# Table name: project_images
#
#  id                :bigint           not null, primary key
#  use_purpose(type) :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  image_id          :bigint
#  project_id        :bigint
#
# Indexes
#
#  index_project_images_on_image_id                 (image_id)
#  index_project_images_on_project_id               (project_id)
#  index_project_images_on_project_id_and_image_id  (project_id,image_id) UNIQUE
#  index_project_images_on_use_purpose              (use_purpose)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#  fk_rails_...  (project_id => projects.id)
#
require 'rails_helper'

RSpec.describe ProjectImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
