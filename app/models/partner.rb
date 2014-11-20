# == Schema Information
#
# Table name: partners
#
#  id                   :integer          not null, primary key
#  logo_color           :string(255)
#  logo_black_and_white :string(255)
#  url                  :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Partner < ActiveRecord::Base
  translates :title, :body
  accepts_nested_attributes_for :translations, allow_destroy: true
end
