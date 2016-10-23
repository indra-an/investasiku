class LearningModule < ApplicationRecord
  belongs_to :posted_by, :class_name => 'Admin'

  before_save :generate_slug

  validates_presence_of :title, :content
  validates_uniqueness_of :title

  # before_save: generating slug from title
  def generate_slug
    self.slug = self.title[0..47].parameterize
  end
end
