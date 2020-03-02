class CreateDoctorPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :doctor_patients do |t|
      t.references :doctors, foreign_key: true
      t.references :patients, foreign_key: true
    end
  end
end
