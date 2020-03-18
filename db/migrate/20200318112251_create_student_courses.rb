class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.belongs_to :student
      t.belongs_to :course
    end
  end
end
