feature 'updating a bookmark' do
  it 'shows the updated bookmark' do
    visit('/bookmarks')
    adding_bookmark(url: 'http://www.netflix.com', title: 'Netflix')
    click_button('Update')
    fill_in('url', with: "http://www.netflicks.com")
    fill_in('title', with: "Netflicks")
    click_button('Submit')
    expect(page).to have_content('Netflicks')
    expect(page).not_to have_content('Netflix')
    expect(current_path).to eq '/bookmarks'
  end
end
