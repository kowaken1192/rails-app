class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :all_day
      t.string :memo

      t.timestamps
    end
  end
end
