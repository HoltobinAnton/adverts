require 'rails_helper'

feature 'the advert interface' do
  background do
    @user = create(:user)
    @advert = create(:advert, user_id: @user.id)
    visit root_path
  end
  
  context 'Display content' do
    it 'should display the attributes of the advert' do
      expect(page).to have_content(@advert.user.full_name)
      expect(page).to have_content(@advert.description)
      expect(page).to have_css("img[src*='default.png']")
    end
  end

  scenario 'Create new adverts' do
    expect(page).not_to have_content('Create new Advert')
    click_link 'Sign in'
    fill_in_signin_fields(@user.login, @user.password)
    expect(page).to have_content('Create new Advert')
    expect{
      click_link 'Create new Advert'
      fill_in 'advert[description]', with: Faker::Lorem.sentence(2)
      click_button 'Create'
    }.to change{Advert.count}.by(1)
  end

  scenario 'Destroy an advert' do
    click_link 'Sign in'
    fill_in_signin_fields(@user.login, @user.password)
    visit advert_path(@advert.id)
    expect(page).to have_content('Destroy')
    expect{
      click_link 'Destroy'
    }.to change{Advert.count}.by(-1)
  end

  scenario 'Update an advert' do
    click_link 'Sign in'
    fill_in_signin_fields(@user.login, @user.password)
    visit advert_path(@advert.id)
    expect(page).to have_content('Edit')
    expect{
      click_link 'Edit'
      fill_in 'advert[description]', with: Faker::Lorem.sentence(2)
      click_button 'Create'
    }.to change { @advert.reload.description }
  end


end