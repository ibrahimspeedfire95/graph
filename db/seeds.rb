# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

student = Student.new(name: 'ibrahim', password: 'ibrahim', email: 'ibrahim@gmail.com')
student.save

course = Course.new(name: 'database', tutor_name: 'absd')
course.student = student
course.save

m1 = Material.new(name: 'intro', material_type: 'video', price: '15')
m1.course = course
m1.save

(0..5000).each do |i|
  m = Material.new(name: i, material_type: 'video', price: '15')
  m.course = course
  m.save
end