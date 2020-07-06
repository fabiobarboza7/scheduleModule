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

end

