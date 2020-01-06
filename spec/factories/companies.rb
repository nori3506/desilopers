# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  address    :string(255)
#  name       :string(255)      not null
#  phone      :string(255)
#  prefecture :string(255)
#  status     :string(255)      not null
#  zip        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :company do
    name { "MyString" }
    status { "MyString" }
    phone { "MyString" }
    zip { "MyString" }
    prefecture { "MyString" }
    address { "MyString" }
  end
end