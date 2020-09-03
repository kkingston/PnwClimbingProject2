class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string "name"
      t.string "style"
      t.integer "grade"
      t.integer "stars"
      t.string "pitches"
      t.string "location"
      t.integer "user_id"
      
      t.timestamps
    end
  end
end
