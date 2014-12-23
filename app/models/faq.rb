class Faq < ActiveRecord::Base

  translates :source
  default_scope { includes(:translations) }
  
  accepts_nested_attributes_for :translations, allow_destroy: true
end
