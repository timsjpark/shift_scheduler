require 'rails_helper'

feature 'Signing up as a manager' do
  scenario 'should allow a new user to sign up as a manager' do
    manager = FactoryGirl.build(:manager)

    visit '/'

    first('.item').click_link('Signup')

    fill_in 'First Name', with: manager.first_name
    fill_in 'Last Name', with: manager.last_name
    fill_in 'Email', with: manager.email
    fill_in 'Employee Number', with: manager.employee_number
    fill_in 'Password', with: manager.password
    fill_in 'Password Confirmation', with: manager.password_confirmation

    click_button 'Signup'

    click_link 'New Organization'

    fill_in 'Name', with: 'SKB'

    click_button 'Create Organization'

    click_link 'Add Department'

    fill_in 'Name', with: 'Sanitation'

    click_button 'Create Department'

    expect(page).to have_content(manager.email)
    expect(page).to have_content('Sanitation')
    expect(page).to have_content('Shifts')
  end
end
