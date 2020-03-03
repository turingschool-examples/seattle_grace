class CreateSurgery < ActiveRecord::Migration[5.1]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day
    end
  end
end
