require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :day}
    it {should validate_presence_of :or_number}
  end
  describe 'relationships' do
    it {should have_many :surgery_doctors}
    it { should have_many(:doctors).through(:surgery_doctors)}
  end

  it '.doctor_count' do
    #need test
  end
end
