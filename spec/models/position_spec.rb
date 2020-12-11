require 'rails_helper'

RSpec.describe Position, type: :model do
  subject { FactoryBot.create(:position) }

  context 'all field are ok' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'missing worker' do
    it 'is not valid' do
      subject.worker = nil
      expect(subject).to_not be_valid
    end
  end
end
