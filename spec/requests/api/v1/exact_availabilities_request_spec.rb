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
																																							    start_datetime: Time.now+1,
                                                                                  end_datetime: Time.now+2
																																							  } 
																											}
      expect(response).to have_http_status(:created)
    end
  end

  describe "UPDATE /exact_availabilities" do
    it "should update an exact availability" do
      exact_availability = ExactAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        start_datetime: Time.now.to_datetime+1,
        end_datetime: Time.now.to_datetime+2
      )
      put "/api/v1/exact_availabilities/#{exact_availability.id}", :params => { :exact_availability => {  
                                                                                                          start_datetime: Time.now+3,
                                                                                                          end_datetime: Time.now+4,
                                                                                                        } 
                                                                              }
      expect(response).to have_http_status(:ok)
    end

    it "should not update a doctor_id" do
      exact_availability = ExactAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        start_datetime: Time.now+1,
        end_datetime: Time.now+2
      )
      put "/api/v1/exact_availabilities/#{exact_availability.id}", :params => { :exact_availability => {  
                                                                                                          doctor_id: SecureRandom.hex(8),
                                                                                                          start_datetime: Time.now+2,
                                                                                                          end_datetime: Time.now+3
                                                                                                        } 
                                                                              }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /exact_availabilities" do
    it "should delete a exact availability" do
      exact_availability = ExactAvailability.create!(
        doctor_id: SecureRandom.hex(8),
        start_datetime: Time.now+1,
        end_datetime: Time.now+2
      )
      delete "/api/v1/exact_availabilities/#{exact_availability.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
