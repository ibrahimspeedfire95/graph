class AddStudentToCourses < ActiveRecord::Migration[5.1]
  def change
  	add_reference :courses, :student, index: true
  	add_foreign_key :courses, :students
  end
end
