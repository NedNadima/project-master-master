class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :Name
      t.string :Description
      t.string :Price

      t.timestamps
    end
  end
end
