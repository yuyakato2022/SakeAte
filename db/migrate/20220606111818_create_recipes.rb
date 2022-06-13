class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :explanation
      t.text :ingredient
      t.text :procedure
      t.float :rate
      t.timestamps
    end
  end
end
