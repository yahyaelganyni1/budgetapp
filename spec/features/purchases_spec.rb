require 'rails_helper'

RSpec.feature 'Purchases', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
    FactoryBot.build_list(:purchase, 3, user: @user, category_ids: [@category.id])
  end

  scenario 'View list of purchases' do
    visit category_path(@category)
    @category.purchases.each do |purchase|
      expect(page).to have_content purchase.name
    end
  end

  scenario 'View total amount of category' do
    visit category_path(@category)
    expect(page).to have_content @category.amount
  end

  scenario 'Clicking ADD NEW PURCHASE opens form' do
    visit category_path(@category)
    click_link 'ADD NEW PURCHASE'
    expect(page).to have_current_path(new_purchase_path)
  end
end
