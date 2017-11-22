require 'rails_helper'

feature 'the comment interface', type: :feature do
  background do
    @user = create :user
    @advert = create :advert
    visit advert_path(@advert.id)
  end
  
  scenario 'Create new comment', js: true do
    expect(page).to have_content('Only registered users can leave comments')
    click_link 'Sign in'
    fill_in_signin_fields(@user.login, @user.password)
    visit advert_path(@advert.id)
    expect(page).to have_content('Write new comment')
    expect(page).not_to have_content('Only registered users can leave comments')
    expect{
      fill_in 'comment[description]', with: Faker::Lorem.sentence(2)
      click_button 'Create'
    }.to change{@advert.comments.count}.by(1)
  end

   scenario 'update' do
    click_link 'Sign in'
    fill_in_signin_fields(@user.login, @user.password)
    visit advert_path(@advert.id)
    fill_in 'comment[description]', with: Faker::Lorem.sentence(2)
    click_button 'Create'
    visit advert_path(@advert.id)
    expect {
      click_link 'Change'
      fill_in 'comment[description]', with: 'new desc'
      click_button 'Update'
    }.to change{@advert.comments.last.description}.to ('new desc')
   end
end