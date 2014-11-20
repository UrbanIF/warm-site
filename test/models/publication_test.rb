# == Schema Information
#
# Table name: publications
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  link        :string(255)
#  source_link :string(255)
#

require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
