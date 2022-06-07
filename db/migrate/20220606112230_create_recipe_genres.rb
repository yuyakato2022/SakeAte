class CreateRecipeGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_genres do |t|
      t.references :recipe
      t.references :alcohol

      t.timestamps
    end
  end
end
