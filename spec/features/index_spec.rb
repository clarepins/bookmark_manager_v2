
feature "index page for bookmark manager" do
  scenario "basic index page" do
    visit '/'
    expect(page).to have_content "Bookmark Manager!"
  end
end
