class CreateVehicules < ActiveRecord::Migration
  def change
    create_table :vehicules do |t|
      t.string :plaque

      t.timestamps
    end
  end
end
