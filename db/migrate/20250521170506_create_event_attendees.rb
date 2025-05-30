class CreateEventAttendees < ActiveRecord::Migration[8.0]
  def change
    create_table :event_attendees do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :event_attendees, [ :event_id, :user_id ], unique: true
  end
end
