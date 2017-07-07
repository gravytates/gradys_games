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

  it 'will produce errors when creating a new game with empty fields' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Games'
    expect(page).to have_content 'All Games'
    click_link 'Add New Game'
    fill_in 'game_name', with: ''
    fill_in 'game_description', with: 'Italian Plumber saves the world'
    fill_in 'game_price', with: 59.99
    select "Platformer", :from => "game_genre"
    select "Switch", :from => "game_platform"
    fill_in 'game_image', with: 'http://png-4.findicons.com/files/icons/2297/super_mario/256/paper_mario.png'
    click_button 'Create Game'
    expect(page).to have_content 'errors'
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

  it 'will produce errors when editing a game with empty fields' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    FactoryGirl.create(:game)
    visit games_path
    click_link 'Final Fantasy'
    expect(page).to have_content 'Description:'
    click_link 'Edit'
    fill_in 'game_name', with: ''
    click_button 'Update Game'
    expect(page).to have_content 'errors'
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

  it 'will add a review for a game' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    FactoryGirl.create(:game)
    visit games_path
    click_link 'Final Fantasy'
    click_link 'New Review'
    fill_in 'review_body', with: 'These guys are going all in to save the world. We should honor their bravery.'
    select 4, from: 'review_rating'
    click_button 'Create Review'
    expect(page).to have_content 'Review successfully added!'
  end
end
