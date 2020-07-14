require 'rails_helper'
RSpec.describe ExactAvailability, type: :model do

	subject {
		described_class.new(
	    doctor_id: SecureRandom.hex(8),
	    start_datetime: Time.now+1,
	    end_datetime: Time.now+2
  	)
	}

	describe "Model exact_availabilities" do
		it "should have be valid with valid attributes" do
    	expect(subject).to be_valid
  	end
		
		it "should have doctor_id" do
			expect(subject).to be_valid      
  	end

  	it "should have start_datetime" do
			expect(subject).to be_valid      
  	end

  	it "should have end_datetime" do
			expect(subject).to be_valid      
  	end
	end
end
