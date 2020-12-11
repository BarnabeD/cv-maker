require 'rails_helper'

RSpec.describe Graduate, type: :model do
  before do
    @graduate = FactoryBot.create(:graduate)
  end

  context 'all field are ok' do
    it 'is valid' do
      expect(@graduate).to be_valid
    end
  end

  context 'name is not present' do
    it 'is not valid' do
      @graduate.name = nil
      expect(@graduate).to_not be_valid
    end
  end

  context 'speciality is not present' do
    it 'is not valid' do
      @graduate.speciality = ''
      expect(@graduate).to_not be_valid
    end
  end

  context 'school_name is not present' do
    it 'is not valid' do
      @graduate.school_name = ''
      expect(@graduate).to_not be_valid
    end
  end

  context 'school_department is not present' do
    it 'is not valid' do
      @graduate.school_department = ''
      expect(@graduate).to_not be_valid
    end
  end

  context 'graduation_date is not present' do
    it 'is not valid' do
      @graduate.graduation_date = nil
      expect(@graduate).to_not be_valid
    end
  end

  context 'graduation_date is tomorrow' do
    it 'is not valid' do
      @graduate.graduation_date = Date.tomorrow
      expect(@graduate).to_not be_valid
    end
  end

  context 'worker is not present' do
    it 'is not valid' do
      @graduate.worker = nil
      expect(@graduate).to_not be_valid
    end
  end

  context 'name is already taken' do
    it 'is not valid' do
      bad_graduate = FactoryBot.build(:graduate)
      bad_graduate.name = @graduate.name
      expect(bad_graduate).to_not be_valid
    end
  end

  context 'wrong department number' do
    it 'is not valid' do
      @graduate.school_department = "wrong"
      expect(@graduate).to_not be_valid
    end
  end
end
