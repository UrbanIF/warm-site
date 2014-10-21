class Partner < ActiveRecord::Base
  translates :title, :body
  accepts_nested_attributes_for :translations, allow_destroy: true
end
