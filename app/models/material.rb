class Material < ApplicationRecord
	
    # t.string "name"
    # t.string "material_type"
    # t.bigint "course_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.decimal "price"
    # t.index ["course_id"], name: "index_materials_on_course_id"
    # t.index ["price"], name: "index_materials_on_price"

    TYPES = [ TYPES_VIDEO = "video", TYPE_AUDIO = "audio"]

    validates :name, presence: true, uniqueness: { scope: :material_type, case_sensitive: true }
    validates :material_type, presence: true, inclusion: { in: TYPES }
    validates :price, presence: true, numericality: { only_integer: true, odd: true }

    belongs_to :course

    before_save :hello, unless: Proc.new { |material| material.name == 'z' }

    def hello
        self.name = "hellssssss"
    end

end
