class AddGradeToStudentCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :student_courses, :grade, :integer
  end
end
