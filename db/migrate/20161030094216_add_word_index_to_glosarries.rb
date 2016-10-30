class AddWordIndexToGlosarries < ActiveRecord::Migration[5.0]
  def change
    add_column :glosarries, :word_index, :string
  end
end
