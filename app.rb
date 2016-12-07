require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'

enable :sessions
set :session_secret, 'dsafqdf13ef13edafsad242'
set :database, "sqlite3:demo.sqlite3"

#
# Home
#
get '/' do
  erb :index
end

#
# Users index
#
get '/users' do
  @users = User.all
  erb :"users/index"
end

#
# Show form for creating new user
#
get '/users/new' do
  erb :"users/new"
end

#
# Show single user
#
get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end

#
# Show form for editing user
#
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"users/edit"
end

#
# Create user
#
post '/users' do
  User.create(
    fname: params[:fname],
    lname: params[:lname],
    email: params[:email]
  )

  redirect '/users'
end

#
# Update user
#
patch '/users/:id' do
  @user = User.find(params[:id])
  @user.fname = params[:fname]
  @user.lname = params[:lname]
  @user.email = params[:email]
  @user.save
  redirect '/users/' + params[:id]
end

#
# Delete user
#
delete '/users/:id' do
  User.find(params[:id]).destroy
  redirect '/users'
end

#
# Get movie
#
get '/movies' do
  @movies = Movie.all
  erb :"movies/index"
end

#
# Show form for creating new movie
#
get '/movies/new' do
  erb :"movies/new"
end

#
# Show single movie
#
get '/movies/:id' do
  @movie = Movie.find(params[:id])
  erb :"movies/show"
end

#
# Show form for editing movie
#
get '/movies/:id/edit' do
  @movie = Movie.find(params[:id])
  erb :"movies/edit"
end

#
# Delete movie
#
delete '/movies/:id' do
  Movie.find(params[:id]).destroy
  redirect '/movies'
end

#
# Create movie
#
post '/movies' do
  Movie.create(
    title: params[:title],
    year: params[:year],
    rating: params[:rating]
  )

  redirect '/movies'
end

#
# Update movie
#
patch '/movies/:id' do
  @movie = Movie.find(params[:id])
  @movie.title = params[:title]
  @movie.year = params[:year]
  @movie.rating = params[:rating]
  @movie.save
  redirect '/movies/' + params[:id]
end
