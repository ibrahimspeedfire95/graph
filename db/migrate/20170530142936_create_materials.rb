class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
	  	t.string :name
	  	t.string :material_type
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
