# == Schema Information
#
# Table name: markers
#
#  id              :integer          not null, primary key
#  latitude        :string(255)
#  longitude       :string(255)
#  address         :string(255)
#  icon            :string(255)
#  marker_group_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  city            :string(255)      default("")
#

require 'test_helper'

class MarkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
