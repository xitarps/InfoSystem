class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title_pt_br
      t.string :title_es
      t.string :description_pt_br
      t.string :description_es
      t.string :file

      t.timestamps
    end
  end
end
