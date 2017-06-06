class Course < ApplicationRecord

    # t.string "name"
    # t.string "tutor_name"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

	validates :name, presence: true, length: { minimum: 5 }
	validates :tutor_name, presence: true

	belongs_to :student

	has_many :materials, dependent: :destroy

	def self.as_json_full_courses courses
		# x = [5,2,3,7]
		# Course.where(id: x).includes(:materials).sort_by {|a| x.index(a.id)}
		courses = courses.includes(:materials)
		courses.map { |course|
			data = course.as_json_full_courses
		}
	end

	def as_json_full_courses
		data = self.as_json
		data.merge!({ 'materials' => self.materials })

		return data
	end
end
