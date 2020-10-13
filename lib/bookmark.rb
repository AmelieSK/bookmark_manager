require 'pg'
require 'pry'

class Bookmark
attr_reader :url, :title, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test' )
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.map do |row|
        url = row["url"] 
        title = row["title"]
        id = row["id"]
        new(url, title, id)
      end
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    conn.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}')")
    # all = conn.exec( "SELECT * FROM bookmarks" ) do |result|
    #   result.map do |row|
    #     url = row["url"] 
    #     title = row["title"]
    #     id = row["id"]
    #     new(url, title, id)
    #   end
    # end
    # all.last
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    conn.exec("DELETE FROM bookmarks WHERE id='#{id}'")
  end

end
