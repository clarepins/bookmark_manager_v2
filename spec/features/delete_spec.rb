feature 'delete' do
  scenario 'delete one bookmark' do
    visit('/bookmarks/new')
    fill_in(:title, with: 'test_BBC')
    fill_in(:url, with: 'http://www.bbc.co.uk')
    click_button 'Go!'
    check('test_BBC')
    click_button 'Delete'
    expect(page).not_to have_link('test_BBC', href: 'http://www.bbc.co.uk')
  end

  scenario 'deletes more than one bookmark' do
    visit('/bookmarks/new')
    fill_in(:title, with: 'test_BBC')
    fill_in(:url, with: 'http://www.bbc.co.uk')
    click_button 'Go!'
    click_button 'Add bookmark'
    fill_in(:title, with: 'Gov.uk')
    fill_in(:url, with: 'http://www.gov.uk')
    click_button 'Go!'
    check('test_BBC')
    check('Gov.uk')
    click_button 'Delete'
    expect(page).not_to have_link('test_BBC', href: 'http://www.bbc.co.uk')
    expect(page).not_to have_link('Gov.uk', href: 'http://www.gov.uk')
  end

end
