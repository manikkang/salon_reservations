class CreateMasterSalonServices < ActiveRecord::Migration[6.1]
  def change
    create_table :master_salon_services do |t|
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
