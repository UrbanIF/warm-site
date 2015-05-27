# == Schema Information
#
# Table name: news_photos
#
#  id         :integer          not null, primary key
#  photo      :string(255)
#  news_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class NewsPhoto < ActiveRecord::Base
  belongs_to :news
  mount_uploader :photo, NewPhotoUploader
end
