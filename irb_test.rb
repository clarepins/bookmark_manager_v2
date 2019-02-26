require 'pg'
connection = PG.connect(dbname: 'bookmark_manager')
result = connection.exec('SELECT * FROM bookmarks')
result.each { |bookmark| p bookmark }
