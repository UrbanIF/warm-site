# == Schema Information
#
# Table name: publications
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  link        :string(255)
#  source_link :string(255)
#  date        :date
#

class Publication < ActiveRecord::Base
  before_save :set_date

  translates :title, :source
  accepts_nested_attributes_for :translations, allow_destroy: true
  default_scope { includes(:translations) }
  scope :order_by_date, -> { order(date: :desc) }
  private
    def set_date
      self.date = Date.today if self.date.nil?
    end
end
