require 'rails_helper'

RSpec.describe "Api::V1::ExactAvailabilities", type: :request do
	describe "GET /exact_availabilities" do
    it "should get exact availabilities" do
      get '/api/v1/exact_availabilities'
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /exact_availabilities" do
    it "should create exact availability" do
      post '/api/v1/exact_availabilities', :params => { :exact_availability => {  
                                                                                  doctor_id: SecureRandom.hex(8),
																																							    start_datetime: "2020-07-07T18:58:19.168Z",
                                                                                  end_datetime: "2020-07-07T18:58:20.168Z",
																																							  } 
																											}
      expect(response).to have_http_status(:created)
    end
  end
# 
  describe "UPDATE /exact_availabilities" do
    it "should update a recurring availability" do
      exact_availability = ExactAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        start_datetime: "2020-07-07T18:58:19.168Z",
        end_datetime: "2020-07-07T18:58:20.168Z",
      )
      put "/api/v1/exact_availabilities/#{exact_availability.id}", :params => { :exact_availability => {  
                                                                                                          start_datetime: "2020-07-07T18:58:19.168Z",
                                                                                                          end_datetime: "2020-07-07T18:58:20.168Z",
                                                                                                        } 
                                                                              }
      expect(response).to have_http_status(:ok)
    end

    it "should not update a doctor_id" do
      exact_availability = ExactAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        start_datetime: "2020-07-07T18:58:19.168Z",
        end_datetime: "2020-07-07T18:58:20.168Z",
      )
      put "/api/v1/exact_availabilities/#{exact_availability.id}", :params => { :exact_availability => {  
                                                                                                          doctor_id: SecureRandom.hex(8),
                                                                                                          start_datetime: "2020-07-07T18:58:19.168Z",
                                                                                                          end_datetime: "2020-07-07T18:58:20.168Z",
                                                                                                        } 
                                                                              }
      expect(response).to have_http_status(:forbidden)
    end
  end
  # 

  describe "DELETE /exact_availabilities" do
    it "should delete a exact availability" do
      exact_availability = ExactAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        start_datetime: "2020-07-07T18:58:19.168Z",
        end_datetime: "2020-07-07T18:58:20.168Z",
      )
      delete "/api/v1/exact_availabilities/#{exact_availability.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
