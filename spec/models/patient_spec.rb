require 'rails_helper'

describe Patient, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many :doctor_patients}
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'instance methods' do
    it "returns patients ordered by age" do
      Patient.destroy_all

      patient_1 = Patient.create!(
          name: "Katie Bryce",
          age: 24,
        )

      patient_2 = Patient.create!(
          name: "Denny Smith",
          age: 39,
        )

      patient_3 = Patient.create!(
          name: "Rebecca Pope",
          age: 25,
        )

      patient_4 = Patient.create!(
          name: "Zola Sheperd",
          age: 2,
        )


    expect(Patient.order_by_age).to eq([patient_2, patient_3, patient_1, patient_4])
    end
  end
end
