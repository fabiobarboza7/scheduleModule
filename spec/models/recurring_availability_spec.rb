require 'rails_helper'

RSpec.describe RecurringAvailability, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  recurring_availability = RecurringAvailability.new(
  	doctor_id: SecureRandom.hex(8),
  	weekday: :saturday,
  	start_time: Time.now,
  	end_time: Time.now,
  	start_date: Time.now,
  	end_date: Time.now
	)
  describe "Model recurring_availabilities" do
  	it "should be valid with valid attributes" do
    	expect(recurring_availability).to be_valid
  	end

    it "should doctor_id" do
			recurring_availability.doctor_id = nil
  		expect(recurring_availability).to_not be_valid      
    end
    
    it "should weekday" do
      recurring_availability.weekday = nil
  		expect(recurring_availability).to_not be_valid      
    end

    it "should start_time" do
      recurring_availability.start_time = nil
  		expect(recurring_availability).to_not be_valid      
    end

    it "should end_time" do
      recurring_availability.end_time = nil
  		expect(recurring_availability).to_not be_valid      
    end

    it "should start_date" do
      recurring_availability.start_date = nil
  		expect(recurring_availability).to_not be_valid      
    end

    it "should end_date" do
      recurring_availability.end_date = nil
  		expect(recurring_availability).to_not be_valid      
    end

    
  end
end
