class InvestmentTip < ApplicationRecord
  belongs_to :posted_by, :class_name => 'Admin'

  before_save :generate_slug

  validates_presence_of :title, :content
  validates_uniqueness_of :title

  scope :search, ->(query) {
    where('investment_tips.title ILIKE ? OR
           investment_tips.content ILIKE ?', "%#{query}%", "%#{query}%")
  }

  # before_save: generating slug from title
  def generate_slug
    self.slug = self.title[0..47].parameterize
  end
end
