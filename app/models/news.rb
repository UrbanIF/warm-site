class News < ActiveRecord::Base
  translates :title, :short, :body
  accepts_nested_attributes_for :translations, allow_destroy: true
end
