class LaughTracksApp < Sinatra::Base

  get '/' do
    erb :"home"
  end

  get '/comedians' do
    @specials = Special.all
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
    erb :"index"
  end



end
