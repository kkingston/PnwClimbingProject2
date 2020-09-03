class ChangeGradeColumnToIntegerInRoutes < ActiveRecord::Migration[6.0]
  def change
    change_column :routes, :grade, :string
  end
end
