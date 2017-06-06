# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

student = Student.new(name: 'ibrahim', password: 'ibrahim', email: 'ibrahim@gmail.com')
student.save

course1 = Course.new(name: 'Database', tutor_name: 'absd')
course1.student = student
course1.save

course2 = Course.new(name: 'Math', tutor_name: 'absd')
course2.student = student
course2.save(validate: false)

course3 = Course.new(name: 'Introduction to CS', tutor_name: 'absd')
course3.student = student
course3.save


(0..10).each do |i|
  m = Material.new(name: "Database #{i}", material_type: 'video', price: '15')
  m.course = course1
  m.save
end

(0..10).each do |i|
  m = Material.new(name: "Math #{i}", material_type: 'video', price: '15')
  m.course = course2
  m.save
end

(0..10).each do |i|
  m = Material.new(name: "Introduction #{i}", material_type: 'video', price: '15')
  m.course = course3
  m.save
end