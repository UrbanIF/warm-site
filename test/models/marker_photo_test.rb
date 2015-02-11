# == Schema Information
#
# Table name: marker_photos
#
#  id         :integer          not null, primary key
#  photo      :string(255)
#  title      :string(255)
#  marker_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class MarkerPhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
