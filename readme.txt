As a user, I would like to see a list with all the bookmarks.

As a user, I would like to add a new bookmark to the list.

CLIENT: path '/bookmarks'  -> method GET -> CONTROLLER: app.rb  -> .all -> MODEL: class Bookmark

-> array [bookmarks] -> CONTROLLER -> array [bookmarks] -> VIEWS: erb bookmarks -> html ->

-> CONTROLLER -> response -> CLIENT: renders html

Database set up instructions

Connect to psql
CREATE DATABASE 'bookmark_manager';
Connect to the database \c 'bookmark_manager';
Execute db/migrations/01_create_bookmark_manager.sql
See the table \dt ir \d+ 'table name'


