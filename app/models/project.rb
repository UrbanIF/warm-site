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

class Project < ActiveRecord::Base
  translates :title, :short, :body
  accepts_nested_attributes_for :translations, allow_destroy: true
end
