# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  image        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  show_on_mine :boolean          default(TRUE)
#  date         :date
#

class News < ActiveRecord::Base
  before_save :set_date
  mount_uploader :image, NewsUploader
  translates :title, :short, :body
  accepts_nested_attributes_for :translations, allow_destroy: true

  scope :main, -> { where(show_on_mine: true) }
  scope :order_by_date, -> { order(date: :desc) }
  scope :for_main, -> { main.order_by_date.limit(3) }

  private
    def set_date
      self.date = Date.today if self.date.nil?
    end
end
