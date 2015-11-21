require 'rails_helper'

feature 'Editing employees' do
  scenario 'should allow a user to edit exisiting employees' do
    Employee.create(first_name: 'Bob', last_name: 'Boss',
      email: 'bob.ross@pbs.org', employee_number: '07041995',
      password: 'password', password_confirmation: 'password'
    )

    visit '/employees'

    click_link 'Edit'

    fill_in 'First Name', with: 'Julia'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'julia@smith.com'

    click_button 'Update Employee'

    # I expect to be redirected to the Julia's page

    expect(current_path).to eq('/employees/1')
    expect(page).to have_content('Julia Smith was updated')

    click_link 'Back'

    within '#employee_table' do
      expect(page).to have_content('Julia')
      expect(page).to have_content('Smith')
      expect(page).to have_content('julia@smith.com')
      expect(page).to have_content('07041995')
      expect(page).to have_content("#{Time.new.strftime('%m/%d/%Y')}")
    end

    # Need to add hire date to the scaffold
    # How to prevent hire date and employee number from changing?
  end
end
