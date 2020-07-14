require 'rails_helper'

RSpec.describe "Api::V1::Schedules", type: :request do
	describe "GET /schedules" do
    it "should get schedules" do
      get '/api/v1/schedules'
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /schedules" do
    it "should create schedule" do
    	recurring_availability = RecurringAvailability.create!(
		    doctor_id: SecureRandom.hex(8),
		    weekday: :saturday,
		    start_time: "2020-07-07T18:58:19.168Z",
		    end_time: "2020-07-07T18:58:20.168Z",
		    start_date: Date.today,
		    end_date: Date.today + 1
		  )
      post '/api/v1/schedules', :params => { :schedule => {  
																														recurring_availability_id: recurring_availability.id,
                                                            doctor_id: SecureRandom.hex(8),
                                                            patient_id: SecureRandom.hex(8),
																												    start_datetime: Time.now+1,
                                                            end_datetime: Time.now+2,
																														confirmation_at: Time.now+1,
																														confirmation_deadline: Time.now+2
																												  } 
																						}
      expect(response).to have_http_status(:created)
    end
  end
# 
  describe "UPDATE /schedules" do
    it "should update a schedule" do
    	recurring_availability = RecurringAvailability.create!(
		    doctor_id: SecureRandom.hex(8),
		    weekday: :saturday,
		    start_time: "2020-07-07T18:58:19.168Z",
		    end_time: "2020-07-07T18:58:20.168Z",
		    start_date: Date.today,
		    end_date: Date.today + 1
		  )

    	schedule = Schedule.create!(
    		recurring_availability_id: recurring_availability.id,
        doctor_id: SecureRandom.hex(8),
        patient_id: SecureRandom.hex(8),
		    start_datetime: Time.now+1,
        end_datetime: Time.now+2,
				confirmation_at: Time.now+1,
				confirmation_deadline: Time.now+2
			)

      put "/api/v1/schedules/#{schedule.id}", :params => { :schedule => {  
		                                                                      doctor_id: SecureRandom.hex(8),
		                                                                      patient_id: SecureRandom.hex(8),
																																			    start_datetime: Time.now+1,
		                                                                      end_datetime: Time.now+2,
																																					confirmation_at: Time.now+1,
																																					confirmation_deadline: Time.now+2
                                                                        } 
                                                          }
      expect(response).to have_http_status(:ok)
    end
  end
  # 

  describe "DELETE /schedules" do
    it "should delete a schedule" do
    	recurring_availability = RecurringAvailability.create!(
		    doctor_id: SecureRandom.hex(8),
		    weekday: :saturday,
		    start_time: "2020-07-07T18:58:19.168Z",
		    end_time: "2020-07-07T18:58:20.168Z",
		    start_date: Date.today,
		    end_date: Date.today + 1
		  )
		  
    	schedule = Schedule.create!(
    		recurring_availability_id: recurring_availability.id,
        doctor_id: SecureRandom.hex(8),
        patient_id: SecureRandom.hex(8),
		    start_datetime: Time.now+1,
        end_datetime: Time.now+2,
				confirmation_at: Time.now+1,
				confirmation_deadline: Time.now+2
			)
			
      delete "/api/v1/schedules/#{schedule.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
