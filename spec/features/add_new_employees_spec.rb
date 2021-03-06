require 'rails_helper'

feature 'Adding employees' do
  scenario 'should let user add a new employee' do
    employee = FactoryGirl.create(:employee)
    employee2 = FactoryGirl.create(:employee)

    visit login_path

    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password

    click_button('Login')

    expect(page).to have_text("Signed in as #{employee.email}")

    visit '/employees'

    click_link 'New Employee'

    fill_in 'First Name', with: employee2.first_name
    fill_in 'Last Name', with: employee2.last_name
    fill_in 'Email', with: employee2.email
    fill_in 'Employee Number', with: '07041995'
    fill_in 'Password', with: employee2.password
    fill_in 'Password Confirmation', with: employee2.password

    click_button 'Add Employee'

    expect(page).to have_content "#{employee2.first_name.capitalize} #{employee2.last_name.capitalize} was added on #{Time.new.strftime('%m/%d/%Y')}"

    visit '/employees'

    within("#employee_table") do
      expect(page).to have_content("#{employee2.first_name}")
      expect(page).to have_content("#{employee2.last_name}")
      expect(page).to have_content("#{employee2.email}")
      expect(page).to have_content('07041995')
    end
  end

  scenario 'should let user add a second employee' do
    employee = FactoryGirl.create(:employee)
    employee2 = FactoryGirl.create(:employee)

    visit login_path

    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password

    click_button('Login')

    expect(page).to have_text("Signed in as #{employee.email}")
    visit '/employees'

    click_link 'New Employee'

    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Ross'
    fill_in 'Email', with: 'bob.ross@pbs.org'
    fill_in 'Employee Number', with: '07041995'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'

    click_button 'Add Employee'

    expect(page).to have_content "Bob Ross was added on #{Time.new.strftime('%m/%d/%Y')}"

    visit '/employees'

    within("#employee_table") do
      expect(page).to have_content(employee2.first_name)
      expect(page).to have_content(employee2.last_name)
      expect(page).to have_content(employee2.email)
      expect(page).to have_content(employee2.employee_number)
      expect(page).to have_content('Bob')
      expect(page).to have_content('Ross')
      expect(page).to have_content('bob.ross@pbs.org')
      expect(page).to have_content('07041995')
    end
  end
end
