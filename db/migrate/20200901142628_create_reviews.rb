class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :route_id
      t.date :date
      t.string :time
      t.integer :stars
      t.text :difficulty
      t.text :experience
      t.text :beta
      t.boolean :recommended

      t.timestamps
    end
  end
end
