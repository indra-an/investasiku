namespace :cron do
  desc 'Process queued newsletters'
  task broadcast_newsletters: :environment do
    begin
      NewsletterQueue.queued.each(&:broadcast)
    rescue
    end
  end
end
