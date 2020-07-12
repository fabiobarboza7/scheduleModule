class ExactAvailability < ApplicationRecord
	validate :prevent_update_doctor, on: :update

	private

	def prevent_update_doctor
		if doctor_id_changed?
    	errors.add(:doctor_id, "doctor_id cannot be updated") 
    end
	end
end
