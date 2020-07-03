class CreateRecurringAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :recurring_availabilities do |t|
      t.text :doctor_id
      t.integer :weekday
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
