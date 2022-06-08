class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[employee admin]

  validates :name, :email, :private_number, :position, presence: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :private_number, uniqueness: { case_sensitive: false },
                             format: { with: /\A\d+\z/, message: 'Private number can only have digits.' }

  validates :name, length: { minimum: 5 }
  validates :position, length: { minimum: 3 }
  validates :password, confirmation: { case_sensitive: true }
end
