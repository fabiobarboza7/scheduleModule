class Api::V1::RecurringAvailabilitiesController < Api::V1::ApiController

	def index
		recurring_availabilities = RecurringAvailability.all

		if recurring_availabilities.any?
			render json: { 
				data: recurring_availabilities, 
				count: recurring_availabilities.count 
			}
		else
			render json: { data: [], count: 0 }, status: :ok
		end
	end

	def create
		recurring_availability = RecurringAvailability.new(recurring_params)

		if recurring_availability.save
			render json: { data: recurring_availability }, status: :created
		else
			render json: { data: recurring_availability.errors }, status: :bad_request
		end
	end

	def update
		recurring_availability = RecurringAvailability.find(params[:id])

		if recurring_availability.update(recurring_params)
			render json: { data: recurring_availability }, status: :ok
		else
			render json: { data: recurring_availability.errors }, status: :bad_request
		end
	end

	def destroy
		recurring_availability = RecurringAvailability.find(params[:id])

		if recurring_availability.destroy
			render json: { data: recurring_availability }, status: :ok
		end
	end

	private

	def recurring_params
		params.require(:recurring_availability).permit(
			:doctor_id, 
			:weekday, 
			:start_time, 
			:end_time, 
			:start_date,
			:end_date,
		)
	end
end
