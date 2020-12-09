require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'all field are ok' do
    it 'is valid' do
      company = Company.create(name: 'my_company', city: 'Lyon')
      expect(company).to be_valid
    end
  end

  context 'name is not present' do
    it 'is not valid' do
      company = Company.create(city: 'Lyon')
      expect(company).to_not be_valid
    end
  end

  context 'name is blank' do
    it 'is not valid' do
      company = Company.create(name: '', city: 'Lyon')
      expect(company).to_not be_valid
    end
  end

  context 'city is not present' do
    it 'is not valid' do
      company = Company.create(name: 'my_company')
      expect(company).to_not be_valid
    end
  end
end
