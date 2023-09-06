require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
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

  scenario 'Create//Delete a Recipe' do
    visit recipes_path
    click_link 'Add Recipe'
    fill_in 'Name', with: 'Pie'
    fill_in 'Prepration time', with: '1'
    fill_in 'Cooking time', with: '0.5'
    fill_in 'Description', with: 'Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.'
    click_button 'Add Recipe'
    assert_text 'Pie', count: 1
    assert_text 'Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.', count: 1
    click_link 'Pie'
    assert_text 'Prepration Time: 1.0 Hour', count: 1
    assert_text 'Cooking Time: 0.5 Hour', count: 1
    visit recipes_path
    click_button 'Delete'
    assert_text 'Pie', count: 0
    assert_text 'Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.', count: 0
    sleep 1
  end
end
