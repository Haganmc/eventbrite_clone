class ChangeEventDateToDatetime < ActiveRecord::Migration[8.0]
  def change
    change_column :events, :event_date, :datetime
  end
end
