class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true, class_name: "Admin"

  scope :last_month_count, -> {
    where('DATE(visits.started_at) >= ? AND DATE(visits.started_at) <= ?',
      Date.today.at_beginning_of_month.last_month, Date.today.at_end_of_month.last_month).count
  }

  scope :this_month_count, -> {
    where('DATE(visits.started_at) >= ? AND DATE(visits.started_at) <= ?',
      Date.today.at_beginning_of_month, Date.today.at_end_of_month).count
  }
end
