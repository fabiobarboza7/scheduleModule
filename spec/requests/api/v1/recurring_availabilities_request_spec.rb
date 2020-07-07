require 'rails_helper'

RSpec.describe "Api::V1::RecurringAvailabilities", type: :request do
  describe "GET /recurring_availabilities" do
    it "should get recurring availabilities" do
      get '/api/v1/recurring_availabilities'
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /recurring_availabilities" do
    it "should create recurring availability" do
      post '/api/v1/recurring_availabilities', :params => { :recurring_availability => {  
																																									      	doctor_id: SecureRandom.hex(8), 
																																									      	weekday: :saturday,
																																											    start_time: "2020-07-07T18:58:19.168Z",
                                                                                          end_time: "2020-07-07T18:58:20.168Z",
                                                                                          start_date: Date.today,
                                                                                          end_date: Date.today + 1
																																											  } 
																													}
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /recurring_availabilities" do
    it "should delete a recurring availability" do
      recurring_availability = RecurringAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        weekday: :saturday,
        start_time: "2020-07-07T18:58:19.168Z",
        end_time: "2020-07-07T18:58:20.168Z",
        start_date: Date.today,
        end_date: Date.today + 1
      )
      delete "/api/v1/recurring_availabilities/#{recurring_availability.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "UPDATE /recurring_availabilities" do
    it "should update a recurring availability" do
      recurring_availability = RecurringAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        weekday: :saturday,
        start_time: "2020-07-07T18:58:19.168Z",
        end_time: "2020-07-07T18:58:20.168Z",
        start_date: Date.today,
        end_date: Date.today + 1
      )
      put "/api/v1/recurring_availabilities/#{recurring_availability.id}", :params => { :recurring_availability => {  
                                                                                          doctor_id: SecureRandom.hex(8), 
                                                                                          weekday: :monday,
                                                                                        } 
                                                                            }
      expect(response).to have_http_status(:ok)
    end
  end

end
