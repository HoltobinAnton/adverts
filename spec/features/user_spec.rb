require 'rails_helper'

feature 'the comment interface', type: :feature do
  background do
    create :role
    visit root_path
    click_link 'Sign up'
  end
  context 'create new user' do
    it 'check attr' do
      click_link 'Sign up'
      expect(page).to have_content('Login')
      expect(page).to have_content('Password')
      expect(page).to have_content('Confirm Password')
      expect(page).to have_content('Email')
      expect(page).to have_content('Full Name')
      expect(page).to have_content('Birthday')
    end
    scenario 'create first and second steps' do
      expect{
        fill_in 'user[login]', with: 'newlogin'
        fill_in 'user[password]', with: 'pass123456'
        fill_in 'user[password_confirmation]', with: 'pass123456'
        fill_in 'user[email]', with: 'email@gmail.com'
        fill_in 'user[full_name]', with: 'FirstName LastName'
        fill_in 'user[birthday]', with: Faker::Date.between(2.days.ago, Date.today)
        click_button 'Next step'
        expect(current_path).to eq('/user')
        fill_in 'address[state]', with: 'Ukraine'
        fill_in 'address[country]', with: 'Ukraine'
        fill_in 'address[city]', with: 'Dnipro'
        fill_in 'address[address]', with: 'Gydroparkova 10/105'
        fill_in 'address[zip]', with: '49000'
        click_button 'Create user'
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('My account')
        expect(page).not_to have_content('Sign in')
        expect(page).not_to have_content('Sign up')

      }.to change{User.count}.by(1)
    end
  end


end