class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user_id
      t.string :name
      t.text :explanation
      t.text :procedure

      t.timestamps
    end
  end
end
