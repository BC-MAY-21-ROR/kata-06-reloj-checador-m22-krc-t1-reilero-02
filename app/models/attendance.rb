# == Schema Information
#
# Table name: attendances
#
#  id         :bigint           not null, primary key
#  check_in   :datetime
#  check_out  :datetime
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Attendance < ApplicationRecord
  belongs_to :user
end
