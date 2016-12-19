class NewsletterQueue < ApplicationRecord
  validates_presence_of :subject, :content

  enum :status => [:queued, :processing, :sent, :failed]

  # used by rake cron task to broadcast newsletters
  def broadcast(contact)
    self.processing!
    ApplicationMailer.newsletters(contact, self).deliver_now rescue self.failed!
    self.sent!
  end
end
