class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :product_name,   null: false
      t.text       :description,    null: false
      t.integer    :status_id,      null: false
      t.integer    :ship_price_id,  null: false
      t.integer    :ship_daate_id,  null: false
      t.integer    :price,          null: false
      t.references :user,           foreign_key: true
      t.integer    :category_id,    null: false
      t.integer    :prefecture_id,  null: false

      t.timestamps
    end
  end
end
