class CreatePlacas < ActiveRecord::Migration[5.0]
  def change
    create_table :placas do |t|
      t.string :plate_number
      t.date :date
      t.time :time
      t.string :road

      t.timestamps
    end
  end
end
