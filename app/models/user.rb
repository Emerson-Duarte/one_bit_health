# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  role                   :integer
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = {
    admin: 0,
    patient: 1
  }

  enum role: ROLES

  before_validation { |item| item.role = :patient }

  validates :role, presence: true
  validates :email, uniqueness: true

  has_many :treatments
  has_many :appointments
  has_many :exams

  def admin?
    self.role == "admin"
  end
end
