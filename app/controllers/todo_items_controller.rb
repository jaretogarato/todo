class TodoItemsController < ApplicationController
  def index
    # local var is only available in the method
    # if we want our view to have access to the var
    # we need an instance variable
    @todos = TodoItem.all
    # SELECT * FROM Pages
    # render :index #this is here automatically
  end

  # responsible for showing a specific page
  def show
    @todos = TodoItem.find(params[:id])
    # default action: render :show - app/views/pages/show.html.erb
  end

  # responsible for showing a form to edit an existing page
  def edit
    @todo = TodoItem.find(params[:id]) # this wants to call an "update" method. see bundle exec rails routes to see why
    # default action: render :show - app/views/pages/show.html.erb
  end

  def update
    @todo = TodoItem.find(params[:id])
    if @todo.update(todo_item_params)
      # success
      redirect_to todo_item_path(@todo) #rails magically supplies the ID
    else
      # fail
      render :edit
    end 

  end

  # responsible for showing a form to create a new page
  def new
    @todo = TodoItem.new
    # render :new - app/views/pages/new.html.erb
  end

  # responsible for saving a new record in our database
  def create
    #strong params
    todo = TodoItem.new(todo_item_params) # just a method that we write in our controllers
    # this executes the sql to try to save the new page in the database
    if todo.save # if we save the page
      #success - new record in the database
      redirect_to todo_item_path(todo) # rails is smart enough to generate the id . we use "page_path" because we just tack on "_path" to the rightmost
      # column for the path we want to access
    else
      # fail - failed to execute the sql for some reason
      render :new
    end
  end

  def destroy
    page = TodoItem.find(params[:id])
    page.destroy
    redirect_to root_path # back to the index page. can also use "root path"
  end

  private
  # strong params
  def todo_item_params
    params.require(:todo_item).permit(:title, :body, :completed) # gives us a hash with all our data, restricts it for security purposes
    #params.require(:page) gives us the same things as params[:page], then it's limited by the "requirex`"
  end
end
