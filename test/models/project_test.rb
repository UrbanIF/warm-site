# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  type       :string(255)
#  is_show    :boolean
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
