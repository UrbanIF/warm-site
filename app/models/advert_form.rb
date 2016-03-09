# == Schema Information
#
# Table name: advert_forms
#
#  id            :integer          not null, primary key
#  company_title :string(255)
#  address       :string(255)
#  advice        :boolean
#  layout        :boolean
#  name          :string(255)
#  phone         :string(255)
#  email         :string(255)
#  photo         :string(255)
#  logo          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class AdvertForm < ActiveRecord::Base
  mount_uploader :photo, AdvertFormPhotoUploader
  mount_uploader :logo, AdvertFormLogoUploader

  validates :company_title, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :photo, presence: true
  validates :logo, presence: true

end
