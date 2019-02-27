feature 'add bookmark' do
  scenario 'submit a bookmmark via form' do
    visit('/bookmarks')
    fill_in(:add_bookmark, with: 'http://www.bbc.co.uk')
    click_button 'Go!'
    expect(page).to have_content('bookmark added' && 'http://www.bbc.co.uk')
  end
end
