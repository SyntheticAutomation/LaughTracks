class LaughTracksApp < Sinatra::Base

  get '/' do
    erb :"home"
  end

  get '/comedians' do
    if params[:age] && Comedian.find_by(age: params[:age])
      @comedians = Comedian.where(age: params[:age])
      all_ids = @comedians.each {|comedian| comedian.id}
      @specials = Special.where(comedian_id: all_ids)
    else
      @comedians = Comedian.all
      @specials = Special.all
    end
    erb :"index"
  end

  get '/comedians/new' do
    erb :"new"
  end

  post '/comedians' do
    comedian = Comedian.create(params[:comedian])
    redirect '/comedians'
  end

end
