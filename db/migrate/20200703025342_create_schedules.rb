class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :recurring_availability, null: false, foreign_key: true
      t.text :doctor_id
      t.text :patient_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.datetime :confirmation_at
      t.datetime :confirmation_deadline

      t.timestamps
    end
  end
end
