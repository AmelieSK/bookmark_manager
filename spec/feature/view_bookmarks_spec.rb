describe BookmarkManager, type: :feature do
  it 'shows the homepage' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end

  it 'shows the bookmarks page' do
    conn = PG.connect( dbname: 'bookmark_manager_test' )
    conn.exec( "INSERT INTO bookmarks(url) VALUES('http://www.google.com'), ('http://www.destroyallsoftware.com'), ('http://www.makersacademy.com') ")
    visit('/')
    click_link('Bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.makersacademy.com")
  end
end
