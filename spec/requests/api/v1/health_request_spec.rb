require 'rails_helper'

RSpec.describe "Api::V1::Healths", type: :request do
	describe "GET /healths" do
    it "should get return health status" do
      get '/api/v1/health'
      expect(response).to have_http_status(200)
    end
  end
end
