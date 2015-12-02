class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :shift_description
      t.time :start_time
      t.time :end_time
      t.belongs_to :schedule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
