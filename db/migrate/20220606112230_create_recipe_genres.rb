class CreateRecipeGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_genres do |t|
      t.references :recipe_id
      t.references :alcohol_id

      t.timestamps
    end
  end
end
