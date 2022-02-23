class CreateSalonServices < ActiveRecord::Migration[6.1]
  def change
    create_table :salon_services do |t|
      t.references :salon, index: true, foreign_key: { on_delete: :cascade }
      t.references :service, index: true, foreign_key: { to_table: :master_salon_services, on_delete: :restrict }
      t.integer :duration, null: false
      t.decimal :price, precision: 6, scale: 2, null: false
      t.timestamps
    end
    add_index :salon_services, [:salon_id, :service_id], unique: true
  end
end
