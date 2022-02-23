class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :customer, index: true, foreign_key: { on_delete: :cascade }
      t.references :salon_service, index: true, foreign_key: { to_table: :salon_services, on_delete: :restrict }
      t.decimal :price, precision: 6, scale: 2, null: false
      t.datetime :start_time, null: false
      t.integer :duration, null: false
      t.timestamps
    end
  end
end
