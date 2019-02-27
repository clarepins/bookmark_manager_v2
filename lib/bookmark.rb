require 'pg'

class Bookmark

  def self.all
    choose_envt
    bookmarks = connection.exec("SELECT * FROM bookmarks;")
    bookmarks.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
    choose_envt
    bookmarks = connection.exec("INSERT INTO bookmarks (" + url + ")")
  end


  def choose_envt
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

end
