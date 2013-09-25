class MultipleCategoriesForSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :category_id, :integer
  
    create_table :categories_suppliers do |t|
      t.belongs_to :supplier
      t.belongs_to :category
    end
  end
end
