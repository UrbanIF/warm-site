class StaticPage < ActiveRecord::Base
  translates :vision_title, :vision_text, :values_text, :tasks_text
  accepts_nested_attributes_for :translations, allow_destroy: true
end
