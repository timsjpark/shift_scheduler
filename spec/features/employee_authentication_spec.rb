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

    # And I click 'Logout'
    #
    # And I should see 'Bob Smith has successfully logged out'
    #
    # And I click 'Login'
    #
    # And I fill in email with bob@smith.com
    # And I fill in Password with password
    #
    # I should see 'Welcome back Bob Smith'
  end
end
