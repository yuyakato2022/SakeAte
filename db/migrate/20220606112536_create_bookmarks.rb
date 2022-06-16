class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user
      t.references :recipe
      
      t.timestamps
    end
  end
end
