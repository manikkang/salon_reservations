class CreateSalonOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :salon_owners do |t|
      t.references :salon, index: true, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps
    end
  end
end
