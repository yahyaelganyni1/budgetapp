require 'rails_helper'

RSpec.feature 'NewPurchase', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
  end

  given(:purchase) { FactoryBot.build(:purchase) }

  scenario 'Creating a purchase with valid data' do
    visit new_purchase_path
    within 'form' do
      fill_in 'Name', with: purchase.name
      fill_in 'Amount', with: purchase.amount
      select @category.name
    end
    click_button 'Save'
    expect(page).to have_current_path category_path(@category)
  end

  scenario 'Creating a purchase with invalid data' do
    visit new_purchase_path
    within 'form' do
      fill_in 'Name', with: purchase.name
      fill_in 'Amount', with: purchase.amount
    end
    click_button 'Save'
    expect(page).to have_content 'ADD NEW PURCHASE'
  end
end
