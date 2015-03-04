require 'rails_helper'

describe 'the posts index', type: :feature do

  post = FactoryGirl.create(:post)

  before(:each) do
    visit posts_path
  end

  it 'has a form to create a new post' do
    expect(page).to have_button('Create Post')
  end



  it 'Signs up new user and creates new post' do
    visit new_user_registration_path
    page.fill_in('Email', with: 'test@gmail.com')
    page.fill_in('Password', with: 'mypassword')
    page.fill_in('Password confirmation', with: 'mypassword')
    page.click_button('Sign up')

    page.fill_in('Title', with: 'foobar')
    page.fill_in('Body', with: 'barfoho')
    page.click_button('Create Post')
    expect(current_path).to eq(posts_path)
    expect(page).not_to have_content('error')
    expect(page).to have_content('barfoho')
  end

  it 'sends user to post page when title is clicked' do
    expect(page).to have_link(post.title, href: post_path(post))

  end

  xit 'lists shows the user who created the post' do
    expect(page).to have_content(post.user)
  end
end
