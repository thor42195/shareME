class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.text :postimage, null: false
      t.timestamps
    end
  end
end
