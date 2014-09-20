class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :method
      t.string :book
      t.string :page
      t.integer :preparation_time
      t.integer :total_time

      t.timestamps
    end
  end
end
