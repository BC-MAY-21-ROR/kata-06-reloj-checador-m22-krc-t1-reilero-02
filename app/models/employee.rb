class Employee < ApplicationRecord
  validates :name, :email, :private_number, :position, presence: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :private_number, uniqueness: { case_sensitive: false },
                             format: { with: /\A\d+\z/, message: 'Private number can only have digits.' }

  validates :name, length: { minimum: 5 }
  validates :position, length: { minimum: 3 }
end
