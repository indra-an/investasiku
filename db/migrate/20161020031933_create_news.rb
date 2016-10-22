class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :image
      t.references :posted_by, :references => :admins, :index => true
      t.string :custom_posted_by
      t.string :slug

      t.timestamps
    end
  end
end
