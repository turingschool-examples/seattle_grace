class CreateSurgery < ActiveRecord::Migration[5.1]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day
      t.integer :operating_room
    end
  end
end
