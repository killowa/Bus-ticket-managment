class RemoveNullConstraintFromStudentInTicket < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tickets, :student_id, true
  end
end
