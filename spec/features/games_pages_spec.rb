require 'rails_helper'

describe "admin user routes and features" do
  it 'will test filtering on games page' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    FactoryGirl.create(:game)
    visit games_path
    click_link 'PS4'
    expect(page).to have_content 'Final Fantasy'
    click_link 'Switch'
    expect(page).to have_content 'No results returned. Choose another filter!'
    click_link 'Highest Rating'
    expect(page).to have_content 'Final Fantasy'
  end
end
