class AddPriceToMaterials < ActiveRecord::Migration[5.1]
  def change
    add_column :materials, :price, :decimal
    add_index :materials, :price
  end
end
