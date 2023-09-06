require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  user = User.create(name: 'User One', email: 'userone@example.com', password: '111111')
  before(:all) do
    visit new_user_registration_path
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
    sleep 1
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep 1
  end

  scenario 'Create/Delete a Food' do
    visit foods_path
    assert_selector 'th', text: 'Food', count: 1
    assert_selector 'th', text: 'Measurement Unit', count: 1
    assert_selector 'th', text: 'Unit Price', count: 1
    assert_selector 'th', text: 'Actions', count: 1
    click_link 'Add Food'
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurment unit', with: 'grams'
    fill_in 'Price', with: '10'
    click_button 'Add Food'
    assert_text 'Apple', count: 1
    assert_text 'grams', count: 1
    assert_text '$ 10.0', count: 1
    click_button 'Delete'
    assert_text 'Apple', count: 0
    assert_text 'grams', count: 0
    assert_text '$ 10.0', count: 0
    sleep 1
  end
end
