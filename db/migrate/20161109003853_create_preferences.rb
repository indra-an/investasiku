class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.string :facebook_link
      t.string :twitter_link
      t.string :instagram_link
      t.text :banner_ad_script
      t.text :sidebar_ad_script
      t.references :news, foreign_key: true
      t.references :module_step_1, :references => :learning_modules, :index => true
      t.references :module_step_2, :references => :learning_modules, :index => true
      t.references :module_step_3, :references => :learning_modules, :index => true
      t.references :module_step_4, :references => :learning_modules, :index => true
      t.references :module_step_5, :references => :learning_modules, :index => true

      t.timestamps
    end
  end
end
