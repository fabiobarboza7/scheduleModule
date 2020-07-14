class Api::V1::SchedulesController < Api::V1::ApiController
	
	api :GET, '/api/v1/schedules', 'List schedules'
	def index
		schedules = Schedule.all

		if schedules.any?
			render json: { 
				data: schedules,
				count: schedules.count
			}, status: :ok
		else
			render json: { data: [], count: 0 }, status: :ok
		end
	end

	api :POST, '/api/v1/schedules', 'Create schedule'
	def create
		schedule = Schedule.new(schedule_params)

		if schedule.save
			render json: { data: schedule }, status: :created
		else
			render json: { data: schedule.errors }, status: :bad_request
		end
	end

	api :PUT, '/api/v1/schedules/:id', 'Update schedule'
	def update
		schedule = Schedule.find(params[:id])

		if schedule.update(schedule_params)
			render json: { data: schedule }, status: :ok
		elsif schedule.doctor_id_changed?
			render json: { data: schedule.errors }, status: :forbidden
		else
			render json: { data: schedule.errors }, status: :bad_request
		end
	end

	api :DELETE, '/api/v1/schedules/:id', 'Destroy schedule'
	def destroy
		schedule = Schedule.find(params[:id])

		if schedule.destroy
			render json: { data: schedule }, status: :ok
		end
	end

	private

	def schedule_params
		params.require(:schedule).permit(
			:recurring_availability_id,
			:doctor_id,
			:patient_id,
			:start_datetime, 
			:end_datetime,
			:confirmation_at,
			:confirmation_deadline	
		)
	end
end
