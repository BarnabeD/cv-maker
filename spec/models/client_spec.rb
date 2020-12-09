require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'all field are ok' do
    it 'is valid' do
      client = Client.create(name: 'my_client')
      expect(client).to be_valid
    end
  end

  context 'name is not present' do
    it 'is not valid' do
      client = Client.create()
      expect(client).to_not be_valid
    end
  end

  context 'name is blank' do
    it 'is not valid' do
      client = Client.create(name: '')
      expect(client).to_not be_valid
    end
  end
end
