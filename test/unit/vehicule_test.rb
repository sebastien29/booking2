require 'test_helper'
require 'factory_girl'




class VehiculeTest < ActiveSupport::TestCase

	FactoryGirl.define do
	  factory :vehicule do
	    plaque '1234567'
	  end
	end

  test "une erreur doit se produire lorsque la plaque a plus de 7 caracteres" do
		assert_raise ActiveRecord::RecordInvalid do
			vehicule = FactoryGirl.create(:vehicule, plaque: 12345678)
		end
  end


  test "un vehicule peut etre cree si la plaque fait 7 caracteres" do
		vehicule = FactoryGirl.create(:vehicule, plaque: 1234567)
		assert !vehicule.id.nil?
  end

end
