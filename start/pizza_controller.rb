require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload(' ./models/*')

#  Read - all/index
  get '/pizza_orders' do
    @orders = PizzaOrder.all()
    erb(:index)
  end

  # Create - NEW
  get '/pizza_orders/new' do
    erb(:new)
  end

# CREATE - CREATE
  post '/pizza_orders' do
    @order =PizzaOrder.new(params)
    @order.save()
    erb(:create)
  end

# read - one/show
  get '/pizza_orders/:id' do
    @order = PizzaOrder.find(params[:id])
    erb(:show)
  end

# update

  post '/pizza_orders/:id' do
    @order = PizzaOrder.new(params)
    @order.update()
    erb(:show)
  end

  post '/pizza_orders/:id/delete' do
    @order = PizzaOrder.find(params[:id])
    @order.delete()
    erb(:delete)
  end

# delete
  get '/pizza_orders/:id/edit' do
    @order = PizzaOrder.find(params[:id])
    erb(:edit)
  end


# request response cycle = GET, POST, PUT, DELETE alll going well if code is correct then the response from the server will be a code 200
