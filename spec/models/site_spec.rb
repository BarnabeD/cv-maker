require 'rails_helper'

RSpec.describe Site, type: :model do
  subject { FactoryBot.create(:site) }

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

  context 'site_type is not present' do
    it 'is not valid' do
      subject.site_type = ''
      expect(subject).to_not be_valid
    end
  end

  context 'money_unit is not present' do
    it 'is not valid' do
      subject.money_unit = ''
      expect(subject).to_not be_valid
    end
  end

  context 'amount is not present' do
    it 'is not valid' do
      subject.amount = ''
      expect(subject).to_not be_valid
    end
  end

  context 'start_date is not present' do
    it 'is not valid' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end
  end

  context 'end_date is not present' do
    it 'is not valid' do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end
  end

  context 'start_date is tomorrow' do
    it 'is not valid' do
      subject.start_date = Date.tomorrow
      expect(subject).to_not be_valid
    end
  end

  context 'start_date is after end_date' do
    it 'is not valid' do
      subject.start_date = Date.today - 1.month
      subject.end_date = Date.today - 2.months
      expect(subject).to_not be_valid
    end
  end

  context 'money_unit is not in the list' do
    it 'is not valid' do
      subject.money_unit = 'not in the list'
      expect(subject).to_not be_valid
    end
  end

  context 'site_type is not in the list' do
    it 'is not valid' do
      subject.site_type = 'not in the list'
      expect(subject).to_not be_valid
    end
  end

  context 'confidence is asked' do
    it 'is confident by default' do
      expect(subject.confidence).to eq('confident')
    end

    it '#is_confident? true when confident' do
      expect(subject.is_confident?).to be true
    end

    it '#is_confident? false when not confident' do
      site_confidence_is_not_confident = create(:site, :is_not_confident)
      expect(site_confidence_is_not_confident.is_confident?).to be false
    end

    it '#is_not_sure? true when not sure' do
      site_confidence_is_not_sure = create(:site, :is_not_sure)
      expect(site_confidence_is_not_sure.is_not_sure?).to be true
    end

    it '#is_not_sure? false when not confident' do
      site_confidence_is_not_confident = create(:site, :is_not_confident)
      expect(site_confidence_is_not_confident.is_not_sure?).to be false
    end

    it '#is_not_confident? true when not confident' do
      site_confidence_is_not_confident = create(:site, :is_not_confident)
      expect(site_confidence_is_not_confident.is_not_confident?).to be true
    end

    it '#is_not_confident? false when confident' do
      site_confidence_is_confident = create(:site, :is_confident)
      expect(site_confidence_is_confident.is_not_confident?).to be false
    end
  end

  context '#human_duration' do
    it 'is correct for 1 year duration' do
      expect(subject.human_duration).to eq('1 an')
    end

    it 'is correct for < 1 year duration' do
      site_two_months_duration = create(:site, :two_months_duration)
      expect(site_two_months_duration.human_duration).to eq('2 mois')
    end

    it 'is correct for > 1 year duration' do
      site_two_years_and_three_month_duration = create(:site, :two_years_and_three_month_duration)
      expect(site_two_years_and_three_month_duration.human_duration).to eq('2 ans, et 3 mois')
    end
  end
end
