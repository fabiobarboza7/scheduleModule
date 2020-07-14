class ExactAvailability < ApplicationRecord
	validate :prevent_update_doctor, on: :update

	validates_presence_of :doctor_id
	validates_presence_of :start_datetime
	validates_presence_of :end_datetime

	validate :valid_date
	validate :valid_override
	validate :valid_override_recurring

	private

	def valid_override
		doctors_start = ExactAvailability.where(
			doctor_id: doctor_id, 
			start_datetime: start_datetime..end_datetime, 
		)

		doctors_end = ExactAvailability.where(
			doctor_id: doctor_id, 
			end_datetime: start_datetime..end_datetime
		)

		if doctors_start.present?
			errors.add(:start_datetime, "must not be over existings records")
		end

		if doctors_end.present?
			errors.add(:end_datetime, "must not be over existings records")
		end

	end

	def valid_override_recurring
		# # 2020-12-10 10:00:00
		# doctors_start = RecurringAvailability.where(
		# 	doctor_id: doctor_id, 
		# 	start_time: start_datetime..end_datetime, 
		# )

		# doctors_end = RecurringAvailability.where(
		# 	doctor_id: doctor_id, 
		# 	end_time: start_datetime..end_datetime
		# )

		# if doctors_start.present?
		# 	errors.add(:start_datetime, "must not be over existings recurring records")
		# end

		# if doctors_end.present?
		# 	errors.add(:end_datetime, "must not be over existings recurring records")
		# end
		true
	end

	def valid_date
		if start_datetime	< Time.now
			errors.add(:start_datetime, "must be greater than #{Time.now}")
		end

		if end_datetime.to_datetime < start_datetime
			errors.add(:end_datetime, 'must be greater than start time')
		end
	end

	def prevent_update_doctor
		if doctor_id_changed?
    	errors.add(:doctor_id, "doctor_id cannot be updated") 
    end
	end
end
