# == Schema Information
#
# Table name: markers
#
#  id              :integer          not null, primary key
#  latitude        :string(255)
#  longitude       :string(255)
#  address         :string(255)
#  icon            :string(255)
#  marker_group_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#  city            :string(255)      default("")
#

class Marker < ActiveRecord::Base
  belongs_to :marker_group
  translates :title
  default_scope { includes(:translations) }

  accepts_nested_attributes_for :translations, allow_destroy: true
  mount_uploader :icon, IconUploader

  after_initialize do
    if new_record?
      self.city ||= 'Івано-Франківськ'
    end
  end
end
