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
      graduate = Graduate.create(speciality: '')
      expect(graduate).to_not be_valid
    end
  end

  context 'school_name is not present' do
    it 'is not valid' do
      graduate = Graduate.create(school_name: '')
      expect(graduate).to_not be_valid
    end
  end

  context 'school_department is not present' do
    it 'is not valid' do
      graduate = Graduate.create(school_department: '')
      expect(graduate).to_not be_valid
    end
  end

  context 'graduation_date is not present' do
    it 'is not valid' do
      graduate = Graduate.create(graduation_date: nil)
      expect(graduate).to_not be_valid
    end
  end

  context 'graduation_date is tomorrow' do
    it 'is not valid' do
      graduate = Graduate.create(graduation_date: Date.tomorrow)
      expect(graduate).to_not be_valid
    end
  end

  context 'worker is not present' do
    it 'is not valid' do
      graduate = Graduate.create(worker_id: nil)
      expect(graduate).to_not be_valid
    end
  end
end
