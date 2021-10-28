require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'

get "/" do
  @title = "The Adventures of Sherlock Homes"
  @list_of_contents = File.readlines "data/toc.txt"
  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @list_of_contents = File.readlines "data/toc.txt"
  @heading = @list_of_contents[0]
  @paragraphs = File.readlines "data/chp1.txt"
  erb :chapter
end
