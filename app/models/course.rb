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
		courses.map { |course|
			data = course.as_json
			data.merge!({ 'materials' => course.materials })
		}
	end
end
