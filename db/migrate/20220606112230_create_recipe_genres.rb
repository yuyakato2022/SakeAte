class CreateRecipeGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_genres do |t|
      t.references :recipe, foreign_key: true
      t.references :alcohol, foreign_key: true

      t.timestamps
    end
  end
end
