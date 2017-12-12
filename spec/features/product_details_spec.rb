require 'rails_helper'

RSpec.feature "Visitors can click on the details button to to see a products page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visitor navigates to home page, clicks on product details, and is taken to that products page" do
    # ACT
    visit root_path
    page.first('.product').click_on 'Details'

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content("Reviews from our customers")

  end
end