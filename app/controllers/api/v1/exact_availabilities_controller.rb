class Api::V1::ExactAvailabilitiesController < Api::V1::ApiController
	
	api :GET, '/api/v1/exact_availabilities', 'List exact availabilities'
	def index
		exact_availabilities = ExactAvailability.all

		if exact_availabilities.any?
			render json: { 
				data: exact_availabilities,
				count: exact_availabilities.count
			}, status: :ok
		else
			render json: { data: [], count: 0 }, status: :ok
		end
	end

	api :POST, '/api/v1/exact_availabilities', 'Create an exact availability'
	def create
		exact_availability = ExactAvailability.new(exact_params)

		if exact_availability.save
			render json: { data: exact_availability }, status: :created
		else
			render json: { data: exact_availability.errors }, status: :bad_request
		end
	end

	api :PUT, '/api/v1/exact_availabilities/:id', 'Update a exact availability'
	def update
		exact_availability = ExactAvailability.find(params[:id])

		if exact_availability.update(exact_params)
			render json: { data: exact_availability }, status: :ok
		elsif exact_availability.doctor_id_changed?
			render json: { data: exact_availability.errors }, status: :forbidden
		else
			render json: { data: exact_availability.errors }, status: :bad_request
		end
	end

	api :DELETE, '/api/v1/exact_availabilities/:id', 'Destroy an exact availability'
	def destroy
		exact_availability = ExactAvailability.find(params[:id])

		if exact_availability.destroy
			render json: { data: exact_availability }, status: :ok
		end
	end

	private

	def exact_params
		params.require(:exact_availability).permit(
			:doctor_id,
			:start_datetime, 
			:end_datetime
		)
	end
end
