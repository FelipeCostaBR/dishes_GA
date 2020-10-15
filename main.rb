require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'


get '/' do
# connect to db

db = PG.connect(dbname: 'goodfoodhunting')
# send and sql to the db to execute
# records to returned to us
dishes = db.exec('SELECT * FROM dishes;')
db.close
# binding.pry

  erb :index, locals: { dishes: dishes }
end

get '/details' do
  
  db = PG.connect(dbname: 'goodfoodhunting')
  results = db.exec("SELECT * FROM dishes WHERE id = #{params['id']};")
  db.close
  erb :details, locals: {dish: results[0]}
end

get '/form' do
  erb :new
end

post '/create' do
  db = PG.connect(dbname: 'goodfoodhunting')

  db.exec("INSERT INTO dishes (name, image_url) VALUES ('#{params['name']}','#{params['image_url']}');")
 db.close

 redirect "/"
end

# http methods - they actually have meanings

#a route is both the http method + path