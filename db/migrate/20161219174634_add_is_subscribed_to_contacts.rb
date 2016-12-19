class AddIsSubscribedToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :is_subscribed, :boolean, :default => true
  end
end
