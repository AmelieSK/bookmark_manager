def adding_bookmark(url:, title:)
  click_button 'Add'
  fill_in(:url, with: "#{url}")
  fill_in(:title, with: "#{title}")
  click_button 'Save'
end
