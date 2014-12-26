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
#  position             :integer
#

class Partner < ActiveRecord::Base
  translates :title, :body
  accepts_nested_attributes_for :translations, allow_destroy: true
  mount_uploader :logo_color, PartnersUploader
  mount_uploader :logo_black_and_white, PartnersUploader

  validates_presence_of :title, :url ,:logo_color, :logo_black_and_white, :position
  validates_uniqueness_of  :position

end
