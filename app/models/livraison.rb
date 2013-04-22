class Livraison < ActiveRecord::Base
    attr_accessible :adresse, :date, :vehicule_id
    
    validates :adresse,  :presence => true
    validates :vehicule_id, :presence => true
    

    
    #validates :vehicule_id, :numericality => { :only_integer => true }
    
    belongs_to :vehicule
end
