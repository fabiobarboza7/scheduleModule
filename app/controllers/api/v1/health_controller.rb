class Api::V1::HealthController < Api::V1::ApiController
	api :GET, '/api/v1/health', 'Check Api health status'
	def status
		render json: { message: "The Caren Schedule Module Api is running successfully" }
	end
end
