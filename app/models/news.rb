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
  before_save :set_date, :set_main_title, :set_mine_short
  mount_uploader :image, NewsUploader
  translates :title, :short, :body, :title_on_mine, :short_on_mine
  globalize_accessors locales: [:uk, :en], attributes: [:title]
  
  accepts_nested_attributes_for :translations, allow_destroy: true

  default_scope { includes(:translations) }
  scope :main, -> { where(show_on_mine: true) }
  scope :order_by_date, -> { order(date: :desc) }
  scope :for_main, -> { main.order_by_date.limit(3) }

  validates_presence_of :title, :short, :body

  private
    def set_main_title
      set_for_all_locales do
        self.title_on_mine = self.title unless self.title_on_mine.present?
      end
    end

    def set_mine_short
      set_for_all_locales do
        self.short_on_mine = self.short unless self.short_on_mine.present?
      end
    end

    def set_date
      self.date = Date.today unless self.date.present?
    end

    def set_for_all_locales
      I18n.available_locales.each { |locale| I18n.with_locale(locale) { yield } }
    end
end
