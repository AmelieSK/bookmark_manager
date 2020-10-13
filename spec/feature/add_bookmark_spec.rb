feature 'adding a new bookmark' do
  it 'displays the new bookmark in the list' do
    visit '/bookmarks'
    # click_button 'Add'
    # fill_in(:url, with: 'http://www.netflix.com')
    # fill_in(:title, with: 'Netflix')
    # click_button 'Save'
    # click_button 'Add'
    # fill_in(:url, with: 'http://www.amazon.com')
    # fill_in(:title, with: 'Amazon')
    # click_button 'Save'
    adding_bookmark(url: 'http://www.netflix.com', title: 'Netflix')
    adding_bookmark(url: 'http://www.amazon.com', title: 'Amazon')
    expect(page).to have_content('Netflix')
    expect(page).to have_content('Amazon')
    expect(current_path).to eq '/bookmarks'
  end
end
