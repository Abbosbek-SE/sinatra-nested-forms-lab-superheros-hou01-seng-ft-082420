require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do 
        erb :super_hero
    end

    post "/teams" do 
        @team = Team.new(params[:team])
        params[:team][:members].each do |member|
            SuperHero.new(member)
        end
        members = SuperHero.all 
        @member1 = members.first
        @member2 = members[1]
        @member3 = members.last 
        erb :team
    end

end
