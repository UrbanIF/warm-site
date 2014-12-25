# == Schema Information
#
# Table name: media_partners
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  logo       :string(255)
#  url        :string(255)
#

class MediaPartner < ActiveRecord::Base
  mount_uploader :logo, PartnersUploader

  validates_presence_of :logo, :url

end
