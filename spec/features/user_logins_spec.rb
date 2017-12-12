require 'rails_helper'

RSpec.feature "", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(first_name: 'Billy', last_name: 'Bob', email: 'email@email.com', password: 'qweqwe', password_confirmation: 'qweqwe')
  end

  scenario "" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: 'qweqwe'
    click_on 'Submit'

    #let page load
    sleep(2)
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content("Products")
  end

end
