# == Schema Information
#
# Table name: news
#
#  id                :integer          not null, primary key
#  image             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  show_on_mine      :boolean          default(TRUE)
#  date              :date
#  slug              :string(255)      default("")
#  show_mine_photo   :boolean          default(TRUE)
#  project_id        :integer
#  show_in_main_list :boolean          default(TRUE)
#

class News < ActiveRecord::Base
  before_save :set_date, :set_slug
  mount_uploader :image, NewsUploader
  translates :title, :short, :body, :title_on_mine, :short_on_mine
  globalize_accessors locales: [:uk, :en], attributes: [:title]
  belongs_to :project
  has_many :news_photos
  accepts_nested_attributes_for :news_photos, allow_destroy: true
  accepts_nested_attributes_for :translations, allow_destroy: true
  # accepts_nested_attributes_for :project, allow_destroy: true

  default_scope { includes(:translations) }
  scope :main, -> { where(show_on_mine: true, show_in_main_list: true) }
  scope :order_by_date, -> { order(date: :desc) }
  scope :for_main, -> { main.order_by_date.limit(3) }
  scope :global, -> { where(show_in_main_list: true) }

  validates_presence_of :title, :short, :body

  def title_on_mine
    self[:title_on_mine].presence || self[:title]
  end

  def short_on_mine
    self[:short_on_mine].presence || self[:short]
  end

  validates_presence_of :slug
  validates_uniqueness_of :slug

  def to_param
    slug
  end

  private
    def set_date
      self.date = Date.today unless self.date.present?
    end

    def set_slug
      self.slug = self.slug.parameterize
    end

end
