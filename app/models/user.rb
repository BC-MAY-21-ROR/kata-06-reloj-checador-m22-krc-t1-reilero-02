# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string
#  position               :string
#  private_number         :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  active                 :boolean
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  role                   :integer          default("employee")
#  branch_id              :bigint           not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[employee admin]
  belongs_to :branch

  validates :name, :email, :private_number, :position, presence: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :private_number, uniqueness: { case_sensitive: false },
                             format: { with: /\A\d+\z/, message: 'can only have digits.' }

  validates :name, length: { minimum: 5 }
  validates :position, length: { minimum: 3 }

end
