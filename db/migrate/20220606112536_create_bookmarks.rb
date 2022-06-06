class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user_id
      t.references :recipe_id

      t.timestamps
    end
  end
end