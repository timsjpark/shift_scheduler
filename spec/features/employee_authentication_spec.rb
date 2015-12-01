require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user signup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link('Signup')

    fill_in 'First Name', with: 'bob'
    fill_in 'Last Name', with: 'smith'
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'

    click_button('Signup')

    expect(page).to have_text("Thank you for signing up Bob Smith")
    expect(page).to have_text('Signed in as bob@smith.com')
  end

  scenario 'allows a user login' do
    employee = FactoryGirl.create(:employee)

    visit '/'

    expect(page).to have_link('Login')

    click_link('Login')

    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password

    click_button('Login')

    expect(page).to have_text("Welcome back #{employee.first_name}")
    expect(page).to have_text("Signed in as #{employee.email}")
  end

  scenario 'do not allow a user login with invalid email or password' do
    employee = FactoryGirl.create(:employee, password: 'password')

    visit login_path

    fill_in 'Email', with: employee.email
    fill_in 'Password', with: "INVALID_PASSWORD"

    click_button('Login')

    expect(page).to have_text("Invalid email or password")
    expect(page).to_not have_text("Welcome back #{employee.first_name}")
    expect(page).to_not have_text("Signed in as #{employee.email}")
  end

  scenario 'allow logging in user to logout' do
    employee = FactoryGirl.create(:employee)

    visit login_path

    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password

    click_button('Login')

    expect(page).to have_text("Signed in as #{employee.email}")

    expect(page).to have_link('Logout')

    click_link 'Logout'

    expect(page).to have_content("#{employee.email} has been logged out")
    expect(page).to_not have_text("Welcome back #{employee.first_name}")
    expect(page).to_not have_text("Signed in as #{employee.email}")
  end
end
