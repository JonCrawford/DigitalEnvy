class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_file, :string
      t.integer :user_id

      t.timestamps
    end
  end
end
