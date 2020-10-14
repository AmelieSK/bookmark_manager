require './lib/database_connection'
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
    result = DatabaseConnection.query( "SELECT * FROM bookmarks" )
    result.map do |row|
      url = row["url"] 
      title = row["title"]
      id = row["id"]
      new(url, title, id)
    end
  end

  def self.create(url:, title:)
    DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.update(id:, url:, title:)
    DatabaseConnection.query(update_query(id, url, title))
  end

  private

  def self.update_query(id, url, title)
    if url.length == 0
      "UPDATE bookmarks SET title='#{title}' WHERE id='#{id}'"
    elsif title.length == 0
      "UPDATE bookmarks SET url='#{url}' WHERE id='#{id}'"
    else
      "UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id='#{id}'"
    end
  end

end
