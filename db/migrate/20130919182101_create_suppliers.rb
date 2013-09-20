class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :zip
      t.string :country
      t.string :email
      t.string :phone
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
