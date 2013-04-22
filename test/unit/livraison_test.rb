require 'test_helper'
require 'factory_girl'

class LivraisonTest < ActiveSupport::TestCase

	FactoryGirl.define do
	  factory :livraison do
	    adresse 'mon message'
	    vehicule_id '5'
	  end
	end

	#test "the truth" do
	#assert true
	#end

	test "livraison.save" do
		assert livraison = FactoryGirl.create(:livraison)
		#flunk("message")
	end

	test "PasDeDateLivraison" do
		livraison =  Livraison.new
		assert_nil (livraison.date)
		#flunk("message")
	end

	test "PasDeIdVehicule" do
		livraison =  Livraison.new
		assert_nil (livraison.id)
		#flunk("message")
	end
end
