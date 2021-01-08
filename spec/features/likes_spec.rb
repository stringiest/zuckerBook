feature 'likes' do
  before(:each) do
    Capybara.current_driver = :selenium
  end

  scenario 'signed in user can leave a like on a post' do
    login_and_make_post
    find('.liked-btn').click

    expect(current_path).to eq('/posts')
    expect(page).to have_content('1')
  end

  scenario 'signed in user can downvote on a liked post' do
    login_and_make_post
    find('.liked-btn').click
    find('.liked-btn').click

    expect(current_path).to eq('/posts')
    expect(page).to have_content('0')
  end

  xscenario 'user cannot like if not signed in' do
    visit('/posts')
    find('.liked-btn').click

    expect(current_path).to eq('/posts')
    expect(page).to_not have_content('1')
    expect(page).to have_content('0')
  end

  after(:all) do
    Capybara.use_default_driver
  end
end