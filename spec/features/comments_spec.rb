feature 'comments' do
  before(:all) do
    Capybara.current_driver = :selenium
  end

  scenario 'user can comment on post from posts/show' do
    login_and_make_post
    click_link('comment-link')
    fill_in('comment_body', with: 'It sure is!')
    click_button 'Comment'

    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('It sure is!')
  end

  scenario 'user cannot comment from posts/show if not signed in' do
    login_and_make_post
    click_link('Sign Out')
    visit('/posts')
    click_link('comment-link')

    expect(page).to have_no_button('Comment')
  end

  xscenario 'user can comment on post from posts/index' do
    login_and_make_post
    fill_in('body', with: 'Yes I agree with you')
    click_button('Comment')
    click_link('comment-link')

    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('Yes I agree with you')
  end

  xscenario 'user cannot comment from posts/index if not signed in' do
    login_and_make_post
    click_link('Sign Out')
    visit('/posts')

    expect(page).to have_no_button('Submit')
  end

  after(:all) do
    Capybara.use_default_driver
  end
end
