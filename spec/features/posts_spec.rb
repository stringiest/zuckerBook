feature 'posts' do
  xscenario 'user can sign in and make a post' do
    login_and_make_post

    expect(current_path).to eq('/posts')
    expect(page).to have_content('2021 will be a good year')
  end

  xscenario 'user can edit a post' do
    login_and_make_post
    click_link('Edit')
    fill_in('post_body', with: '')
    fill_in('post_body', with: '2020 sucked')

    click_button('Update Post')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('2020 sucked')
  end

  xscenario 'user can delete a post' do
    login_and_make_post
    click_link('Delete')
    click_link('ok')

    expect(current_path).to eq('/posts')
    expect(page).not_to have_content('2021 will be a good year')
  end
end
