# == Schema Information
#
# Table name: branches
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Branch < ApplicationRecord
  has_many :users
end
