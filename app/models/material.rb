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

    enum material_types: [video: 0, audio: 1]

    belongs_to :course

    validates :name, presence: true, uniqueness: { scope: :material_type, case_sensitive: true }
    validates :material_type, presence: true, inclusion: { in: TYPES }
    validates :price, presence: true, numericality: { only_integer: true, odd: true }
    validates :material_type_enum, presence: true, inclusion: { in: material_types }

    scope :cheap, -> { where(price: 1..5) }
    scope :material_type, -> (type, id) { where(material_type: type, id: id) }
    scope :created_before, -> (time) { where('created_at < :time', time: time) if time.present? }


end
