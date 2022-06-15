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
require "test_helper"

class BranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
