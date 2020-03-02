class CreatePatientsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.timestamps
    end

    create_table :doctor_patients do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
