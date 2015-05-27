# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  status     :string(255)
#  is_show    :boolean
#  weight     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)      default(""), not null
#  big_image  :string(255)
#  file_link  :string(255)
#

class Project < ActiveRecord::Base
  before_save :set_slug
  translates :title, :short, :body
  globalize_accessors locales: [:uk, :en], attributes: [:title]
  mount_uploader :image, ProjectUploader
  mount_uploader :big_image, ProjectsBigImageUploader
  has_many :news
  accepts_nested_attributes_for :translations, allow_destroy: true

  default_scope { includes(:translations) }
  scope :visible, -> { where(is_show: true) }
  scope :big, -> { visible.where(status: 'big') }
  scope :small, -> { visible.where(status: 'small') }
  scope :order_by_weight, -> { order(weight: :desc) }
  validates_presence_of :slug
  validates_uniqueness_of  :slug

  def to_param
    slug
  end

  private
    def set_slug
      self.slug = self.slug.parameterize
    end
end
