feature 'comments' do
  before(:all) do
    Capybara.current_driver = :selenium
  end

  scenario 'user can comment on post on individual post' do
    login_and_make_post
    click_link('comment-link')
    fill_in('comment_body', with: 'It sure is!')
    click_button 'Comment'

    expect(current_path).to eq('/posts/1')
    expect(page).to have_content('It sure is!')
  end

  after(:all) do
    Capybara.use_default_driver
  end
end
