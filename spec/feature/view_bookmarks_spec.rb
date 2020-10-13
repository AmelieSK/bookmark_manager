# describe BookmarkManager, type: :feature do
#   it 'shows the homepage' do
#     visit('/')
#     expect(page).to have_content("Bookmark Manager")
#   end

#   it 'shows the bookmarks page' do
#     Bookmark.create('http://www.google.com')
#     Bookmark.create('http://www.destroyallsoftware.com')
#     Bookmark.create('http://www.makersacademy.com')
#     visit('/')
#     click_link('Bookmarks')
#     expect(page).to have_content("http://www.google.com")
#     expect(page).to have_content("http://www.destroyallsoftware.com")
#     expect(page).to have_content("http://www.makersacademy.com")
#   end
# end
