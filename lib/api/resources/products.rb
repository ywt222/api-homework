require 'sinatra'
require 'mysql'
require 'json'
require_relative '../../domain/models/product'

ActiveRecord::Base.establish_connection(
    :adapter  => 'mysql',
    :host     => 'localhost',
    :username => 'root',
    :password => '',
    :database => 'product_service'
)

get '/products' do
  all_pros =  Product.all
  all_pros.to_json
end

get '/products/:id' do
  pro = Product.find("#{params['id']}")
  pro.to_json
end

post '/products' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  add_pro = Product.new(
          :name => request_payload['name'],
          :category => request_payload['category'],
          :price => request_payload['price']
  )
  add_pro.save
  new_pro = Product.find(add_pro['id'])
  new_pro.to_json
end

put '/products/:id' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
  pro = Product.find("#{params['id']}")
  pro.update(name:request_payload['name'],category:request_payload['category'],
             price:request_payload['price'])
  pro.to_json
end

delete '/products/:id' do
  pro = Product.find("#{params['id']}")
  pro.destroy
end
