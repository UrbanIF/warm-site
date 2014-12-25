# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  status     :string(255)
#  is_show    :boolean
#  weight     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)      default(""), not null
#  big_image  :string(255)
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
