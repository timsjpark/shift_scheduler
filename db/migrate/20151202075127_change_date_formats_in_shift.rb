class ChangeDateFormatsInShift < ActiveRecord::Migration
  def change
    change_column :shifts, :start_time, :datetime
    change_column :shifts, :end_time, :datetime
  end
end
