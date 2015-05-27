# == Schema Information
#
# Table name: news_photos
#
#  id         :integer          not null, primary key
#  photo      :string(255)
#  news_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class NewsPhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
