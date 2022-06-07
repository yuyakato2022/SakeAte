class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :recipe
      t.text :text

      t.timestamps
    end
  end
end
