require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :user }

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

    it 'should have an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'association' do
    context 'has-many categories' do
      subject { FactoryBot.build(:user_categories, categories_count: 3) }

      it 'should have categories' do
        expect(subject.categories.length).to be 3
      end
    end

    context 'has-many purchases' do
      subject { FactoryBot.build(:user_purchases, purchases_count: 5) }

      it 'should have purchases' do
        expect(subject.purchases.length).to be 5
      end
    end
  end
end
