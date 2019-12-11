require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
     erb :super_hero
    end

    post '/teams' do
      @super_hero = SuperHero.new(params[:super_hero])
        params[:super_hero][:teams].each do |details|
          Team.new(details)
        end
        @teams = Team.all
        erb :team
    end


end



