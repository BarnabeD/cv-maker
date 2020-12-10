require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = FactoryBot.create(:company)
  end

  context 'all field are valid' do
    it 'is valid' do
      expect(@company).to be_valid
    end
  end

  context 'name is not present' do
    it 'is not valid' do
      @company.name = ''
      expect(@company).to_not be_valid
    end
  end

  context 'city is not present' do
    it 'is not valid' do
      @company.city = ''
      expect(@company).to_not be_valid
    end
  end

  context 'company name is already taken' do
    it 'is not valid' do
      bad_company = FactoryBot.build(:company)
      bad_company.name = @company.name
      expect(bad_company).to_not be_valid
    end
  end
end
