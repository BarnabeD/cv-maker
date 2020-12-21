require 'rails_helper'

RSpec.describe Worker, type: :model do
  subject { FactoryBot.create(:worker) }

  context 'all field are ok' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'last_name is not present' do
    it 'is not valid' do
      subject.last_name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'first_name is not present' do
    it 'is not valid' do
      subject.first_name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'matricule is not present' do
    it 'is not valid' do
      subject.matricule = ''
      expect(subject).to_not be_valid
    end
  end

  context 'hire_date is not present' do
    it 'is not valid' do
      subject.hire_date = nil
      expect(subject).to_not be_valid
    end
  end

  context 'hire_date is tomorrow' do
    it 'is not valid' do
      subject.hire_date = Date.tomorrow
      expect(subject).to_not be_valid
    end
  end

  context 'birth_date is not present' do
    it 'is not valid' do
      subject.birth_date = nil
      expect(subject).to_not be_valid
    end
  end

  context 'birth_date is tomorrow' do
    it 'is not valid' do
      subject.birth_date = Date.tomorrow
      expect(subject).to_not be_valid
    end
  end


  context 'first_name & last_name is already taken' do
    it 'is not valid' do
      bad_subject = FactoryBot.build(:worker)
      bad_subject.first_name = subject.first_name
      bad_subject.last_name = subject.last_name
      expect(bad_subject).to_not be_valid
    end
  end

  context 'matricule is already taken' do
    it 'is not valid' do
      bad_subject = FactoryBot.build(:worker)
      bad_subject.matricule = subject.matricule
      expect(bad_subject).to_not be_valid
    end
  end

  context 'worker is minor' do
    it 'is not valid' do
      worker_minor = build(:worker, :minor)
      expect(worker_minor).to_not be_valid
    end
  end

  context '#age_in_year' do
    it 'return the good age' do
      worker_is_twenty_five_years_old = create(:worker, :twenty_five_years_old)
      expect(worker_is_twenty_five_years_old.age_in_year).to eq(25)
    end
  end

  context '#duration_since_last_graduate_in_years' do
    it 'return the good duration' do
      worker_five_years_old_graduated = create(:worker, :five_years_old_graduated)
      expect(worker_five_years_old_graduated.duration_since_last_graduate_in_years(worker_five_years_old_graduated.graduates)).to eq(5)
    end
  end

  context '#duration_since_last_graduate_in_years' do
    it 'return duration since 18 old if note graduated' do
      worker_is_twenty_five_years_old = create(:worker, :twenty_five_years_old)
      expect(worker_is_twenty_five_years_old.duration_since_last_graduate_in_years(worker_is_twenty_five_years_old.graduates)).to eq(25 - 18)
    end
  end
end
