class RecurringAvailability < ApplicationRecord
	validate :prevent_update_doctor, on: :update

	validates_presence_of :doctor_id
	validates_presence_of :weekday
	validates_presence_of :start_time
	validates_presence_of	:end_time 
	validates_presence_of :start_date

	WEEK_DAYS = { 
		sunday: 1,
		monday: 2,
		tuesday: 3,
		wednesday: 4,
		thursday: 5,
		friday: 6,
		saturday: 7,
	}

	enum weekday: WEEK_DAYS

	validate :valid_time
	validate :valid_date
	validate :valid_today

	private

	def prevent_update_doctor
		if doctor_id_changed?
    	errors.add(:doctor_id, "doctor_id cannot be updated") 
    end
	end

	def valid_time
		if end_time <= start_time
			errors.add(:end_time, 'must be greater than start time')
		end
	end

	def valid_date
		if end_date.present? && end_date <= start_date
			errors.add(:end_date, 'must be greater than start date')
		end
	end

	def valid_today
		if start_date < Date.today
			errors.add(:start_date, 'must not be less than today')
		end
	end
end

