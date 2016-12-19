namespace :cron do
  desc 'Process queued newsletters'
  task broadcast_newsletters: :environment do
    begin
      Contact.where(:is_subscribed => true).each do |contact|
        NewsletterQueue.queued.each { |q| q.broadcast(contact) }
      end
    rescue
    end
  end
end
