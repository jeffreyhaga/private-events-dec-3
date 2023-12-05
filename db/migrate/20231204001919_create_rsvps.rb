class CreateRsvps < ActiveRecord::Migration[7.1]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
