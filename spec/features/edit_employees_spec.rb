require 'rails_helper'

feature 'Editing employees' do
  scenario 'should allow a user to edit exisiting employees' do
    employee = FactoryGirl.create(:employee)

    visit login_path

    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password

    click_button('Login')

    expect(page).to have_text("Signed in as #{employee.email}")

    visit '/employees'

    within("#employee_table") do
      expect(page).to have_content(employee.first_name)
      expect(page).to have_content(employee.last_name)
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.employee_number)
    end

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
      expect(page).to have_content("#{employee.employee_number}")
      # expect(page).to have_content("#{Time.new.strftime('%m/%d/%Y')}") Not sure if view should have updated date in table
    end

    # Need to add hire date to the scaffold
    # How to prevent hire date and employee number from changing?
  end
end
