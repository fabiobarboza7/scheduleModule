require 'rails_helper'

RSpec.describe RecurringAvailability, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { 
    described_class.new(
    	doctor_id: SecureRandom.hex(8),
    	weekday: :saturday,
    	start_time: "2020-07-07T18:58:19.168Z",
    	end_time: "2020-07-07T18:58:20.168Z",
    	start_date: Date.today,
    	end_date: Date.today + 1
  	)
  }

  describe "Model recurring_availabilities" do
  	it "should have be valid with valid attributes" do
    	expect(subject).to be_valid
  	end

    it "should have doctor_id" do
			subject.doctor_id = nil
  		expect(subject).to_not be_valid      
    end
    
    it "should have weekday" do
      subject.weekday = nil
  		expect(subject).to_not be_valid      
    end

    it "should have start_time" do
      subject.start_time = nil
  		expect(subject).to_not be_valid      
    end

    it "should have end_time" do
      subject.end_time = nil
  		expect(subject).to_not be_valid      
    end

    it "should have start_date" do
      subject.start_date = nil
  		expect(subject).to_not be_valid      
    end
    
  end
end
