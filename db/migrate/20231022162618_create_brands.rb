class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name, limit: 30, null: false

      t.timestamps
    end

    add_index :brands, :name, unique: true
  end
end
