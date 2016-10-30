class Glosarry < ApplicationRecord
  validates_presence_of :title, :description

  before_save :extract_word_index

  scope :word_indexes, -> {
    select(:word_index).order(:word_index => :asc).distinct.collect(&:word_index)
  }

  scope :search, ->(query) {
    where('glosarries.title ILIKE ?', "%#{query}%")
  }

  # before_save: extract word index from glossary title
  def extract_word_index
    self.word_index = self.title[0].upcase
  end
end
