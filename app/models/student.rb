class Student < ApplicationRecord

	validates :name, presence: true
	validates :email, presence: true

	has_secure_password

	has_many :courses
	has_many :materials, through: :courses


	def as_json_full_student
		data = self.as_json
		data[:courses] = Course.as_json_full_courses(self.courses)
		# data.merge!({ 'courses' => Course.as_json_full_courses(self.courses) })
		data.merge!({ 'materials': self.materials })
		return data
	end
end
