require 'rails_helper'

feature 'Adding employees' do
  scenario 'should let user add a new employee' do
    visit '/employees'

    click_link 'New Employee'

    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Ross'
    fill_in 'Email', with: 'bob.ross@pbs.org'
    fill_in 'Employee Number', with: '07041995'

    click_button 'Add Employee'

    expect(page).to have_content "Bob Ross was hired on #{Time.new.strftime('%m/%d/%Y')}"

    visit '/employees'

    within("#employee_table") do
      expect(page).to have_content('Bob')
      expect(page).to have_content('Ross')
      expect(page).to have_content('bob.ross@pbs.org')
      expect(page).to have_content('07041995')
    end
  end

  scenario 'should let user add a second employee' do
    employee = FactoryGirl.create(:employee)

    visit '/employees'

    click_link 'New Employee'

    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Ross'
    fill_in 'Email', with: 'bob.ross@pbs.org'
    fill_in 'Employee Number', with: '07041995'

    click_button 'Add Employee'

    expect(page).to have_content "Bob Ross was hired on #{Time.new.strftime('%m/%d/%Y')}"

    visit '/employees'

    within("#employee_table") do
      expect(page).to have_content(employee.first_name)
      expect(page).to have_content(employee.last_name)
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.employee_number)
      expect(page).to have_content('Bob')
      expect(page).to have_content('Ross')
      expect(page).to have_content('bob.ross@pbs.org')
      expect(page).to have_content('07041995')
    end
  end
end