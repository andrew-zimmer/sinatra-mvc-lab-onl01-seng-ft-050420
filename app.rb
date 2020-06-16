require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base
    get '/' do
        erb :user_input
    end

    post '/piglatinize' do
        @user_input = PigLatinizer.new(params[:user_phrase])
        erb :pig_latinized
    end
end
