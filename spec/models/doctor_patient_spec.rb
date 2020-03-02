require 'rails_helper'

describe DoctorPatient, type: :model do
  describe 'relationships' do
    it {should belong_to :doctors}
    it {should belong_to :patients}
  end
end
