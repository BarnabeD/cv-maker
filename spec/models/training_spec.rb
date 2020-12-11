require 'rails_helper'

RSpec.describe Training, type: :model do
  subject { FactoryBot.create(:training) }

  context 'all field are ok' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'name is not present' do
    it 'is not valid' do
      subject.name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'training_type is not present' do
    it 'is not valid' do
      subject.training_type = ''
      expect(subject).to_not be_valid
    end
  end

  context 'date is not present' do
    it 'is not valid' do
      subject.date = ''
      expect(subject).to_not be_valid
    end
  end

  context 'date is tomorrow' do
    it 'is not valid' do
      subject.date = Date.tomorrow
      expect(subject).to_not be_valid
    end
  end

  context 'training_type is not in the list' do
    it 'is not valid' do
      subject.training_type = 'not in the list'
      expect(subject).to_not be_valid
    end
  end
end
