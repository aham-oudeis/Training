require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'

get "/" do
  @files = Dir.glob('public/*').select { |file| File.ftype(file) == 'file' }.sort
  @files.reverse! if params[:sort] == 'desc'
  erb :main
end
