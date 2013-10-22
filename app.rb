# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class ShortenedUrl < ActiveRecord::Base
end

get '/' do
	erb :index
end

post '/' do
	current = ShortenedUrl.create(url: params[:long_url])
	base_36_id = current.id.to_s(36)
	erb :new, locals: {base_36_id: base_36_id}
end

get '/:shortened' do
	id = params[:shortened].to_i(36)
	entry = ShortenedUrl.find(id)
	redirect entry.url
end