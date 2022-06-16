# == Schema Information
#
# Table name: attendances
#
#  id         :bigint           not null, primary key
#  check_in   :datetime
#  check_out  :datetime
#  users_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Attendance < ApplicationRecord

  has_one :users
  
end
