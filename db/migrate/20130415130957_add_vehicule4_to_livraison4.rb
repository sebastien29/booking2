class AddVehicule4ToLivraison4 < ActiveRecord::Migration
    def change
        
        change_table :livraisons do |t|
            t.references :vehicule
        end
        
        
        
        
    end
end
