# == Schema Information
#
# Table name: marker_groups
#
#  id         :integer          not null, primary key
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MarkerGroup < ActiveRecord::Base
  translates :title
  has_many :markers
  default_scope { includes(:translations) }

  accepts_nested_attributes_for :translations, allow_destroy: true
end
