class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :short_name

      t.timestamps
    end
    
    add_column :recipes, :book_id, :integer
  end
end
