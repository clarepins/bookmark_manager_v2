require 'pg'

class Bookmark

  attr_reader :title, :url, :id

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    self.choose_env
    result = @connection.exec("SELECT * FROM bookmarks;")
    bookmark_array = []
    result.map do |bookmark|
      bookmark_array << Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
    bookmark_array
  end

  def self.add(url:, title:)
    self.choose_env
    result = @connection.exec("INSERT INTO bookmarks (id, title, url) VALUES(DEFAULT, '#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(bookmarks:)
    self.choose_env
    bookmarks.each do |key, value|
      @connection.exec("DELETE FROM bookmarks WHERE title = replace('#{key}','\"','')")
    end
  end

  # def self.update(bookmark:)
  #   @connection.exec("UPDATE bookmarks SET title = ")
  #
  # end

  def self.choose_env
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
