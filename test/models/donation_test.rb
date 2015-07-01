# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  amount     :string(255)
#  success    :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
