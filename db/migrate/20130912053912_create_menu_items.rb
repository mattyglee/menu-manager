class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :recipe_id
      t.integer :menu_id
      t.date :having

      t.timestamps
    end
  end
end
