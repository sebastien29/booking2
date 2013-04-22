class AddVehicule3ToLivraison3 < ActiveRecord::Migration
    def change
        
        change_table :livraisons do |t|
            t.references :vehicule, :null => false
        end
        
        
        add_column :livraisons, :vehicule_id, :integer, :null => false
        
    end
end
