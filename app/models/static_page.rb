class StaticPage < ActiveRecord::Base
  translates :vision_title, :vision_text, :values_text, :tasks_text
  accepts_nested_attributes_for :translations, allow_destroy: true

  globalize_accessors :locales => [:uk, :en], :attributes => [:vision_title, :vision_text, :values_text, :tasks_text]
end
