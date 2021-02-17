class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :reference_id
      t.string  :reference_type
      t.integer :user_id
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
