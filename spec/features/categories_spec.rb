require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  background do
    @user = FactoryBot.create(:user_categories)
    sign_in @user
  end

  scenario 'After login, view categories page' do
    visit root_path
    expect(page).to have_content 'CATEGORIES'
  end

  scenario 'View name, icon and total amount of category' do
    visit root_path
    @user.categories.each do |category|
      expect(page).to have_content category.name
      expect(first('img') { |img| img[:src] == category.icon }).to be_present
    end
  end

  scenario 'Clicking a category opens its purchase page' do
    visit root_path
    category = @user.categories.first
    find("a[href='#{category_url(category)}']").click
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'Clicking ADD NEW CATEGORY opens form' do
    visit root_path
    click_link 'ADD NEW CATEGORY'
    expect(page).to have_current_path(new_category_path)
  end
end
