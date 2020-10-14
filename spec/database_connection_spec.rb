require 'database_connection'

describe '.setup' do
  it 'sets a connection with a specified database' do
    connection = DatabaseConnection.setup('bookmark_manager_test')
    expect(connection.db).to eq 'bookmark_manager_test'
  end
end

describe '.query' do
  it 'executes a query string on the connected database' do
    PG.connect(dbname:'bookmark_manager_test').exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google')")
    DatabaseConnection.setup('bookmark_manager_test')

    response = DatabaseConnection.query('SELECT * from bookmarks')
    expect(response[0]['title']).to eq 'Google'
    expect(response[0]['url']).to eq 'http://www.google.com'
  end
end
