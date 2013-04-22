class Vehicule < ActiveRecord::Base
  attr_accessible :plaque


  validates :plaque,  :presence => true,
    :length => { :minimum => 7, :maximum => 7}



  has_many :livraisons



end
