class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.text :description
      t.text :equipments_description
      t.string :producing_capability
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
