# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                       :bigint           not null, primary key
#  admin                    :boolean          default(FALSE), not null
#  age                      :string(255)
#  area                     :string(255)
#  birthday(誕生日)         :date
#  career_year              :string(255)
#  confirmation_sent_at     :datetime
#  confirmation_token       :string(255)
#  confirmed_at             :datetime
#  current_sign_in_at       :datetime
#  current_sign_in_ip       :string(255)
#  discarded_at             :datetime
#  email                    :string(255)
#  encrypted_password       :string(255)      default(""), not null
#  gender                   :string(255)
#  hobby                    :string(255)
#  image                    :string(255)
#  invitation_accepted_at   :datetime
#  invitation_created_at    :datetime
#  invitation_limit         :integer
#  invitation_sent_at       :datetime
#  invitation_token         :string(255)
#  invitations_count        :integer          default(0)
#  invited_by_type          :string(255)
#  job_hunting              :boolean
#  last_sign_in_at          :datetime
#  last_sign_in_ip          :string(255)
#  name                     :string(255)
#  remember_created_at      :datetime
#  reset_password_sent_at   :datetime
#  reset_password_token     :string(255)
#  sign_in_count            :integer          default(0), not null
#  status(Acount Status)    :string(255)
#  unconfirmed_email        :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id(企業ID)       :bigint
#  invited_by_id            :bigint
#
# Indexes
#
#  index_users_on_company_id                         (company_id)
#  index_users_on_confirmation_token                 (confirmation_token) UNIQUE
#  index_users_on_discarded_at                       (discarded_at)
#  index_users_on_email                              (email) UNIQUE
#  index_users_on_invitation_token                   (invitation_token) UNIQUE
#  index_users_on_invited_by_id                      (invited_by_id)
#  index_users_on_invited_by_type_and_invited_by_id  (invited_by_type,invited_by_id)
#  index_users_on_reset_password_token               (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe User, type: :model do
  # valid with name, email, and password
  it 'is valid with name, email, password' do
    @user = FactoryBot.create(:user)
    @user1 = create(:user, name: 'King', email: 'a@aaa.aaa')
    expect(@user).to be_valid
    expect(@user1).to be_valid
  end
  # invalid without name
  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
