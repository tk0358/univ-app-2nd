class ChangeColumnDefaultGradeToStudentCourses < ActiveRecord::Migration[6.0]
  def change
    change_column_default :student_courses, :grade, 3
  end
end
