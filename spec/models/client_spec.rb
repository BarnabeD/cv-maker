require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.create(:client)
    @bad_client = FactoryBot.build(:client)
  end

  context 'all field are ok' do
    it 'is valid' do
      expect(@client).to be_valid
    end
  end

  context 'name is not present' do
    it 'is not valid' do
      @bad_client.name = ''
      expect(@bad_client).to_not be_valid
    end
  end

  context 'name is already taken' do
    it 'is not valid' do
      @bad_client.name = @client.name
      expect(@bad_client).to_not be_valid
    end
  end
end
