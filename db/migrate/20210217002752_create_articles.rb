class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title_pt_br
      t.string :title_es
      t.string :description_pt_br
      t.string :description_es
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
