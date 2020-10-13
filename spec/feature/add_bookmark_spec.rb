feature 'adding a new bookmark' do
  it 'displays the new bookmark in the list' do
    visit '/bookmarks'
    adding_bookmark(url: 'http://www.netflix.com', title: 'Netflix')
    adding_bookmark(url: 'http://www.amazon.com', title: 'Amazon')
    expect(page).to have_content('Netflix')
    expect(page).to have_content('Amazon')
    expect(current_path).to eq '/bookmarks'
  end
end
