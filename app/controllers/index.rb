get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 

  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  #@urls es la lista de todas las urls
  @urls = Url.all
  #aquí envía la info a la vista 
  erb :index
end

post '/urls' do
  # crea una nueva Url
  @long_url = params[:long_url]
  #asignamos una nueva variable @url para poder llamarla en la vista
  @url = Url.new(long_url: @long_url)
  #si la @url cumple con todas las validaciones entonces te envía nuevamente a la pag principal
  if @url.save
    redirect to ('/')
  #si no, la variable donde se guarda la nueva url ingresada "@url"
  #la envia a la vista al igual que la variable que contiene la lista de urls 
  
  else
    @url
    @urls = Url.all
    erb :index
  end

  
end

# e.g., /q6bda
get '/:short_url' do
  puts "inside get"
  @url_selected = params[:short_url]
  object = Url.find_by({short_url: @url_selected})
  object.click_count += 1
  object.save
  p object 
  redirect to ("#{object.long_url}")
end
  
 