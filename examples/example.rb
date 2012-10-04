$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sunspot_mongomapper'

MongoMapper.configure do |config|
  config.master = Mongo::Connection.new.db('sunspot-mongomapper-test')
end

# model
class Post
  include MongoMapper::Document
  field :title

  include Sunspot::MongoMapper
  searchable do
    text :title
  end
end

# remove old indexes
Post.destroy_all

# indexing
Post.create(:title => 'foo')
Post.create(:title => 'foo bar')
Post.create(:title => 'bar baz')

# commit
Sunspot.commit

# search
search = Post.search do
  keywords 'foo'
end
search.each_hit_with_result do |hit, post|
  p post
end
