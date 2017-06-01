class Course < ApplicationRecord

    # t.string "name"
    # t.string "tutor_name"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

	validates :name, presence: true, length: { minimum: 5 }
	validates :tutor_name, presence: true

	has_many :materials, dependent: :destroy
end
