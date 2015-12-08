class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :shift_description
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :schedule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
