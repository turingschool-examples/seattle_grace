require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

end

# describe 'relationships' do
#   it {should belong_to :doctor_patients}
#   it {should have_many(:doctors).through(:doctor_patients)}
# end

# has_many :doctor_patients
# has_many :doctors, through: :doctor_patients
