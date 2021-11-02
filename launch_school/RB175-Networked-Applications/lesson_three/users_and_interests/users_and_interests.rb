require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = YAML.load_file "users.yaml"
end

helpers do
  def join_by_and(list)
    return list.first.to_s if list.size <= 1
    return list.join(" and ") if list.size == 2
    list[0..-2].join(", ") + ", and #{list[-1]}"
  end

  def total_users
    @users.keys.size
  end

  def total_interests
    @users.map { |name, details| details[:interests]}.flatten.size
  end
end

get "/" do 
  @title = "Users and Interests"
  erb :home
end

get "/:name" do
  @user = params[:name].to_sym
  @title = "#{@user.to_s.capitalize}'s Profile"

  erb :user
end