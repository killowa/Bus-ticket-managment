class RenameUsersToStudents < ActiveRecord::Migration[6.1]
  def change
      rename_table :users, :students
  end
end
