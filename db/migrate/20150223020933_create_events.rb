class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.string :organizer
      t.datetime :start_time
      t.datetime :end_time
      t.string :picture_url
      t.string :description
      t.string :street_address
      t.string :city
      t.string :country
      t.string :zip
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
