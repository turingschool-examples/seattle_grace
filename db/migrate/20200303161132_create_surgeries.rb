class CreateSurgeries < ActiveRecord::Migration[5.1]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day_of_opp
      t.integer :operating_room_number
    end
  end
end
