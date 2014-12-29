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
#  slug         :string(255)      default("")
#

class News < ActiveRecord::Base
  before_save :set_date
  mount_uploader :image, NewsUploader
  translates :title, :short, :body, :title_on_mine, :short_on_mine
  globalize_accessors locales: [:uk, :en], attributes: [:title]

  accepts_nested_attributes_for :translations, allow_destroy: true

  default_scope { includes(:translations) }
  scope :main, -> { where(show_on_mine: true) }
  scope :order_by_date, -> { order(date: :desc) }
  scope :for_main, -> { main.order_by_date.limit(3) }

  validates_presence_of :title, :short, :body

  def title_on_mine
    self[:title_on_mine].presence || self[:title]
  end

  def short_on_mine
    self[:short_on_mine].presence || self[:short]
  end

  validates_presence_of :slug
  validates_uniqueness_of :slug

  private
    def set_date
      self.date = Date.today unless self.date.present?
    end

end
