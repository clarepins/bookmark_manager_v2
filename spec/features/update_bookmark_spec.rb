feature 'update bookmarks' do
  scenario 'user updates the url of a bookmark' do
    visit('/bookmarks/new')
    fill_in(:title, with: 'turtles!')
    fill_in(:url, with: 'www.turtles.com')
    click_button 'Go!'
    check('turtles!')
    click_button('Update')
    fill_in(:url, with: 'www.turtles.co.uk')
    click_button 'Update'
    expect(page).to have_link('turtles!', href: 'www.turtles.co.uk')
    expect(page).not_to have_link('turtles!', href: 'www.turtles.com')
  end
end
