class AddCoordinatesToFacilities < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :latitude, :float
    add_column :facilities, :longitude, :float
  end
end
