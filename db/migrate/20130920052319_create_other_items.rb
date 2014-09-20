class CreateOtherItems < ActiveRecord::Migration
  def change
    create_table :other_items do |t|
      t.integer :shopping_list_id
      t.integer :shopping_item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
