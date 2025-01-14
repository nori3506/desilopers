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

class User < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }
  extend Enumerize
  # email_confirmation・・・ User received a confirmation email but not yet activated
  # company_email_confirmation・・・ same as above but Company user ver.
  # company_regist・・・ Confirmation is done but not yet create company infomation.
  enumerize :status, in: [:active, :deactive, :email_confirmation, :company_email_confirmation, :company_regist], default: :email_confirmation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  before_save { self.email = email.downcase }
  default_scope -> { order(created_at: :desc) }
  validates :password, presence:true, length:{ minimum: 6 }, allow_nil: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{ maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 40 }
  validate :validate_birthday
  mount_uploader :image, ImageUploader
  has_one :portfolio, dependent: :delete
  has_many :tech_users
  has_many :techs, through: :tech_users
  has_many :comments, dependent: :destroy
  has_many :interests
  has_many :interesting_projects, through: :interests, source: 'project'
  has_many :user_projects
  has_many :applied_projects, through: :user_projects, source: 'project'
  has_many :channel_users
  has_many :channels, through: :channel_users
  belongs_to :company, optional: true

  scope :techs_and_portfolio, -> {
    includes(:portfolio, :teches)
  }

  scope :normal_users, -> {
    where(company_id: nil)
  }

  def validate_birthday
    if birthday == ""
      flash[:danger] = "kuso"
    end
  end

  def company_user?
    company_id.present?
  end

  #not send dejault devise confirm email to user
  def send_on_create_confirmation_instructions
    false
  end

  class << self
    def candidates_users(company, condition)
      User.includes([applied_projects: :company]).where('companies.id' => company.id, 'user_projects.status' => condition)
    end
  end
end
