feature 'add bookmark' do
  scenario 'submit a bookmmark via form' do
    visit('/bookmarks/new')
    fill_in(:title, with: 'test_BBC')
    fill_in(:url, with: 'http://www.bbc.co.uk')
    click_button 'Go!'
    title = 'test_BBC'
    url = 'http://www.bbc.co.uk'
    expect(page).to have_link(title, href: url)
  end
end

#This test shouldn't be passing but it is!
