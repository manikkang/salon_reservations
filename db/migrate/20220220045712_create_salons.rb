class CreateSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :slug, null: false, index: { unique: true }
      t.string :gstin, null: false, index: { unique: true }
      t.string :pan, null: false, index: { unique: true }
      t.text :address, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :chairs, null: false
      t.timestamps
    end
  end
end
