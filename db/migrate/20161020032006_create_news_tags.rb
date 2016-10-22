class CreateNewsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :news_tags, :id => false do |t|
      t.references :news, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
