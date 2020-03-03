class CreateSurgeries < ActiveRecord::Migration[5.1]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day
      t.integer :or_number

      t.timestamps
    end
  end
end
