require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test database
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.add(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.add(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq bookmark.title
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
      bookmark = Bookmark.add(url: 'www.bbc.co.uk', title: 'test_BBC')
      persist_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persist_data['id']
      expect(bookmark.title).to eq 'test_BBC'
      expect(bookmark.url).to eq 'www.bbc.co.uk'

    end
  end
end
