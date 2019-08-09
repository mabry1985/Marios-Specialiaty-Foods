class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :rating
      t.text :content_body
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
