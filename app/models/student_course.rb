class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :grade, numericality: { only_integer: true, grater_than_or_equal: 1, less_than_or_equal_to: 5 }
end