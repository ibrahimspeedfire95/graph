class Course < ApplicationRecord

	validates :name, presence: true
	validates :tutor_name, presence: true
end
