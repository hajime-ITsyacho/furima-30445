class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.string :name
      t.integer :charge_id
      t.integer :area_id
      t.integer :delivery_date_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
