class Course < ApplicationRecord

	validates :name, presence: true, length: { minimum: 5 }
	validates :tutor_name, presence: true

	has_many :materials
end
