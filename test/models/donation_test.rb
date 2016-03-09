# == Schema Information
#
# Table name: donations
#
#  id                  :integer          not null, primary key
#  email               :string(255)
#  amount              :string(255)
#  paid_sum            :string(255)
#  paid_at             :datetime
#  paid_status         :string(255)
#  paid_order_id       :string(255)
#  paid_transaction_id :string(255)
#  status              :string(255)
#  success             :boolean          default(FALSE)
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#

require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
