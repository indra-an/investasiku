class News < ApplicationRecord
  mount_uploader :image, NewsCoverUploader

  has_and_belongs_to_many :tags
  belongs_to :posted_by, :class_name => 'Admin'

  before_save :generate_slug

  validates_presence_of :title, :image, :content
  validates_uniqueness_of :title

  scope :search, ->(query) {
    where('news.title ILIKE ? OR news.content ILIKE ?', "%#{query}%", "%#{query}%")
  }

  scope :by_tag, ->(tag_name) {
    unless tag_name.blank?
      joins(:tags).where(:tags => { :name => tag_name })
    end
  }

  scope :find_related, ->(news) {
    joins(:tags).where(:tags => { :id => news.tags.collect(&:id) })
                .where.not(:id => news.id)
                .order(:created_at => :desc).distinct
  }

  # before_save: generating slug from title
  def generate_slug
    self.slug = self.title[0..47].parameterize
  end
end
