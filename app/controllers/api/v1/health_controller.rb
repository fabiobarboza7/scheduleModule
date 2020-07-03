class Api::V1::HealthController < Api::V1::ApiController
	def status
		render json: { message: "The Caren Schedule Module Api is running successfully" }
	end
end
