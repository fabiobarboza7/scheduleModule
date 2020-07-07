class RecurringAvailability < ApplicationRecord
	validates_presence_of :doctor_id
	validates_presence_of :weekday
	validates_presence_of :start_time
	validates_presence_of	:end_time 
	validates_presence_of :start_date
	validates_presence_of :end_date

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

	validate :validate_time
	validate :validate_date
	validate :validate_today

	private

	def validate_time
		if !end_time.nil? && !start_time.nil? && end_time <= start_time
			errors.add(:end_time, 'must be greater than start time')
		end
	end

	def validate_date
		if !end_date.nil? && !start_date.nil? && end_date <= start_date
			errors.add(:end_date, 'must be greater than start date')
		end
	end

	def validate_today
		if !start_date.nil? && start_date < Date.today
			errors.add(:start_date, 'must not be less than today')
		end
	end
end

