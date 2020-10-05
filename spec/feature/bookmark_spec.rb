describe BookmarkManager, type: :feature do
  it 'shows the homepage' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end

  it 'shows the bookmarks page' do
    visit('/')
    click_link('Bookmarks')
    expect(page).to have_content("Google")
    expect(page).to have_content("Yahoo")
    expect(page).to have_content("Github")
  end
end
