class LaughTracksApp < Sinatra::Base

  get '/' do
    erb :"home"
  end

  get '/comedians' do
    @specials = Special.all
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
      all_ids = @comedians.each {|comedian| comedian.id}
      @specials = Special.where(comedian_id: all_ids)
    else
      @comedians = Comedian.all
    end
    erb :"index"
  end



end
