# == Schema Information
#
# Table name: news
#
#  id                :integer          not null, primary key
#  image             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  show_on_mine      :boolean          default(TRUE)
#  date              :date
#  slug              :string(255)      default("")
#  show_mine_photo   :boolean          default(TRUE)
#  project_id        :integer
#  show_in_main_list :boolean          default(TRUE)
#

require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
