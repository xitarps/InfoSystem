class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :description, null: false
      t.string :language, null: false
      t.boolean :allowed, default: false

      t.integer :reference_id
      t.string  :reference_type
      t.integer :user_id

      t.timestamps
    end
  end
end
