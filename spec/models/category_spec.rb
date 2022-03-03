require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :category }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should not have name longer than 100 characters' do
      subject.name = 'A' * 101
      expect(subject).to_not be_valid
    end

    it 'should have an icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'association' do
    context 'belong-to user' do
      subject { FactoryBot.build :category }

      it 'should have a user' do
        expect(subject.user).to be_present
      end
    end

    context 'has-many purchases' do
      subject { FactoryBot.build :category_purchases, purchases_count: 10 }

      it 'should have purchases' do
        expect(subject.purchases.length).to be 10
      end
    end
  end
end
