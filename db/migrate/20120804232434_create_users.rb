class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.integer :storenvy_id

      t.timestamps
    end
  end
end
