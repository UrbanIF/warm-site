# == Schema Information
#
# Table name: advert_forms
#
#  id            :integer          not null, primary key
#  company_title :string(255)
#  address       :string(255)
#  advice        :boolean
#  layout        :boolean
#  name          :string(255)
#  phone         :string(255)
#  email         :string(255)
#  photo         :string(255)
#  logo          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class AdvertFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
