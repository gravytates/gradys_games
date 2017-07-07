require 'rails_helper'

describe "sign up, sign out and sign in" do
  it "will sign a user up" do
    visit root_path
    click_link "Sign Up"
    fill_in "user_name", with: "christ"
    fill_in "user_email", with: "christ@god.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content "You have signed up successfully."
  end

  it 'will sign in a user' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it 'will sign out a user' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    logout(:admin_user)
    login_as(user, :scope => :user)
  end


end
