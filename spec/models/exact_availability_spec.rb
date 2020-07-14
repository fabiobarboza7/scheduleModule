require 'rails_helper'
# doctor_id,weekday,start_time,end_time
RSpec.describe ExactAvailability, type: :model do

	subject {
		described_class.new(
	    doctor_id: SecureRandom.hex(8),
	    start_datetime: "2020-07-07T18:58:19.168Z",
	    end_datetime: "2020-07-07T18:58:20.168Z",
  	)
	}

	describe "Model exact_availabilities" do
		it "should have be valid with valid attributes" do
    	expect(subject).to be_valid
  	end
		
		it "should have doctor_id" do
			subject.doctor_id = nil
			expect(subject).to_not be_valid      
  	end

  	it "should have start_datetime" do
			subject.start_datetime = nil
			expect(subject).to_not be_valid      
  	end

  	it "should have end_datetime" do
			subject.end_datetime = nil
			expect(subject).to_not be_valid      
  	end
	end
end
