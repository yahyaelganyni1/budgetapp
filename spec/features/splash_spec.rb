require 'rails_helper'

RSpec.feature 'Splash', type: :feature do
  scenario 'Display splash screen' do
    visit root_path
    expect(page).to have_content 'Budget on Rails'
    expect(page).to have_link 'LOG IN'
    expect(page).to have_link 'SIGN UP'
  end

  scenario 'Clicking Login opens login page' do
    visit root_path
    click_link 'LOG IN'
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'Clicking Signup opens signup page' do
    visit root_path
    click_link 'SIGN UP'
    expect(page).to have_current_path(new_user_registration_path)
  end
end
