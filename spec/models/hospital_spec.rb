require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should have_many(:patients).through(:doctors)}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
end
