class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user_id
      t.references :recipe_id
      t.text :text

      t.timestamps
    end
  end
end
