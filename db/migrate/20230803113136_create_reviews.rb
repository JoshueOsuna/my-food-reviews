class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :score, null: false
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
