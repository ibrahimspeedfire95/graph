class Material < ApplicationRecord
	validates :name, presence: true
	validates :material_type, presence: true

	belongs_to :course
end
