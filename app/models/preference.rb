class Preference < ApplicationRecord
  belongs_to :news
  belongs_to :investment_tip
  belongs_to :module_step_1, :class_name => 'LearningModule'
  belongs_to :module_step_2, :class_name => 'LearningModule'
  belongs_to :module_step_3, :class_name => 'LearningModule'
  belongs_to :module_step_4, :class_name => 'LearningModule'
  belongs_to :module_step_5, :class_name => 'LearningModule'

  validates_presence_of :news_id, :module_step_1_id, :module_step_2_id,
                        :module_step_3_id, :module_step_4_id, :module_step_5_id
  validates_format_of :facebook_link, :twitter_link, :instagram_link,
                      :with => URI::regexp, :allow_blank => true

  def self.fetch
    first
  end
end
