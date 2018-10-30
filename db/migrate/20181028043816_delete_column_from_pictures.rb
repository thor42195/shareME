class DeleteColumnFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :title
  end
end
