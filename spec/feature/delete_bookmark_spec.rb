feature 'deleting a bookmark' do
  it 'show the list without the deleted bookmark' do
    visit('/bookmarks')
    adding_bookmark(url: 'http://www.netflix.com', title: 'Netflix')
    click_button('Delete')
    expect(page).not_to have_content('Netflix')
  end
end
