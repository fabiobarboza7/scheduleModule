class ExactAvailability < ApplicationRecord
	validate :prevent_update_doctor, on: :update

	validates_presence_of :doctor_id
	validates_presence_of :start_datetime
	validates_presence_of :end_datetime

	validate :valid_date

	private

	def valid_date
		if start_datetime	< Time.now
			errors.add(:start_datetime, "must be greater than #{Time.now}")
		end
		# if !end_date.nil? && !start_date.nil? && end_date <= start_date
		# 	errors.add(:end_date, 'must be greater than start date')
		# end
		if end_datetime < start_datetime	
			errors.add(:end_datetime, 'must be greater than start time')
		end
	end

	def prevent_update_doctor
		if doctor_id_changed?
    	errors.add(:doctor_id, "doctor_id cannot be updated") 
    end
	end
end
