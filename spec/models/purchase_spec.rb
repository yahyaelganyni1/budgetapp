require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :purchase }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should not have name longer than 100 characters' do
      subject.name = 'a' * 101
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount greater than 0' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end
  end

  describe 'association' do
    context 'belong-to user' do
      subject { FactoryBot.build :purchase }

      it 'should have a user' do
        expect(subject.user).to be_present
      end
    end

    context 'has-many categories' do
      subject { FactoryBot.build :purchases_categories, categories_count: 10 }

      it 'should have purchases' do
        expect(subject.categories.length).to be 10
      end
    end
  end
end
