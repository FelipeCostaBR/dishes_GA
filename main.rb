require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

def run_sql(sql)
  db = PG.connect(dbname: 'goodfoodhunting')
  db.close
  return db.exec(sql)
end

get '/' do
  dishes = run_sql('SELECT * FROM dishes ORDER BY name;')
  erb :index, locals: { dishes: dishes }
end

get '/dishes/new' do
  erb :new
end

get '/dishes/:id' do # wildcat, can be anything when it s in :
  results = run_sql("SELECT * FROM dishes WHERE id = #{params['id']};")
  erb :details, locals: {dish: results[0]}
end

get '/dishes/:id/edit' do
  results = run_sql("SELECT * FROM dishes WHERE id = #{params['id']};")
  erb :edit, locals: {dish: results[0]}
end

post '/dishes' do
  run_sql("INSERT INTO dishes (name, image_url) VALUES ('#{params['name']}','#{params['image_url']}');")
  redirect "/"
end

patch '/dishes/:id' do
  run_sql("UPDATE dishes SET name = '#{params['name']}', image_url = '#{params['image_url']}' WHERE id = #{params["id"]};")
  redirect "/dishes/#{params["id"]}"
end

delete '/dishes/:id' do
  run_sql("DELETE FROM dishes WHERE id = #{params['id']}")
  redirect "/"
end


# http methods - they actually have meanings
#a route is both the http method + path
# get - just for reading
# post - to create
# patch - to change
# delete - to delete