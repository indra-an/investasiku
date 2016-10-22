class NewsletterQueue < ApplicationRecord
  validates_presence_of :subject, :content

  enum :status => [:queued, :sent, :failed]

  # used by rake cron task to broadcast newsletters
  def broadcast
    # TODO: send email
    self.status = 1
    self.save
  end
end
