class CreateExactAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :exact_availabilities do |t|
      t.text :doctor_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
