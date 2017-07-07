require 'rails_helper'

describe "admin user routes and features" do
  it 'will create a new game' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Games'
    expect(page).to have_content 'All Games'
    click_link 'Add New Game'
    fill_in 'game_name', with: 'Mario'
    fill_in 'game_description', with: 'Italian Plumber saves the world'
    fill_in 'game_price', with: 59.99
    select "Platformer", :from => "game_genre"
    select "Switch", :from => "game_platform"
    fill_in 'game_image', with: 'http://png-4.findicons.com/files/icons/2297/super_mario/256/paper_mario.png'
    click_button 'Create Game'
    expect(page).to have_content 'Game successfully added!'
  end

  it 'will edit a game' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    FactoryGirl.create(:game)
    visit games_path
    click_link 'Final Fantasy'
    expect(page).to have_content 'Description:'
    click_link 'Edit'
    fill_in 'game_name', with: 'Mario World'
    click_button 'Update Game'
    expect(page).to have_content 'Game successfully updated!'
  end

  it 'will delete a game' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    FactoryGirl.create(:game)
    visit games_path
    click_link 'Final Fantasy'
    expect(page).to have_content 'Description:'
    click_link 'Delete Game'
    expect(page).to have_content 'Game successfully removed!'
  end
end
