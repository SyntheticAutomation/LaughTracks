class LaughTracksApp < Sinatra::Base

  get '/' do
    erb :"home"
  end


end
