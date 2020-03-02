require 'rails_helper'

RSpec.describe PatientDoctor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :doctor_id}
    it {should validate_presence_of :patient_id}
  end

  describe 'relationships' do
    it {should belong_to :doctor}
    it {should belong_to :patient}
  end
end
