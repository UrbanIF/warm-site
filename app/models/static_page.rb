# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class StaticPage < ActiveRecord::Base
  translates :vision_title, :vision_text, :values_text, :tasks_text
  accepts_nested_attributes_for :translations, allow_destroy: true
  default_scope { includes(:translations) }
end
