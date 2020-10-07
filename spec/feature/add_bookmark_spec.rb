feature 'adding a new bookmark' do
  it 'displays the new bookmark in the list' do
    visit '/bookmarks'
    click_button 'Add'
    fill_in('url', with: 'http://www.netflix.com')
    click_button 'Save'

    expect(page).to have_content 'http://www.netflix.com'
    expect(current_path).to eq '/bookmarks'
  end
end
