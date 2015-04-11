class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.string :company

      t.integer :money
      t.timestamps null: false
    end
  end
end
