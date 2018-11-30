class LaughTracksApp < Sinatra::Base

  get '/' do
    erb :"home"
  end

  get '/comedians' do
    @comedians = Comedian.all
    @specials = Special.all
    erb :"index"
  end


end
