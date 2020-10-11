feature 'adding a new bookmark' do
  it 'displays the new bookmark in the list' do
    visit '/bookmarks'
    click_button 'Add'
    fill_in('url', with: 'http://www.netflix.com')
    fill_in('title', with: 'Netflix')

    click_button 'Save'

    expect(bookmark['url']).to eq 'http://www.netflix.com'
    expect(bookmark['title']).to eq 'Netflix'
    expect(current_path).to eq '/bookmarks'

end
end
