class AddDepartmentToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :department, :string
  end
end
