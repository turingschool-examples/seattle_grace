class CreateDoctorSurgeries < ActiveRecord::Migration[5.1]
  def change
    create_table :doctor_surgeries do |t|
      t.references :doctor, foreign_key: true
      t.references :surgery, foreign_key: true
    end
  end
end
