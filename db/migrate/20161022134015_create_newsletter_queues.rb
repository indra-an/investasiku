class CreateNewsletterQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletter_queues do |t|
      t.string :subject
      t.text :content
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
