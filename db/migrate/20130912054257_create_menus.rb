class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :start_date

      t.timestamps
    end
  end
end
