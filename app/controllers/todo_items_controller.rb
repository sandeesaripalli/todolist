class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  # GET /todo_items
  # GET /todo_items.json
  def index
    @list_id = params[:list_id]
    id = @list_id
    if @list_id.nil?
      @list_id = session[:list_id]
      id = @list_id
    end
    puts "The id of the list is #{id}"
    @todo_items = Todo.find(id).todo_items
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
  end

  # GET /todo_items/new
  def new
    session[:list_id] =  params[:list_id]
    @todo_item = TodoItem.new
  end

  # GET /todo_items/1/edit
  def edit
  end

  # POST /todo_items
  # POST /todo_items.json
  def create
    @todo_item = TodoItem.new(todo_item_params)
    list = Todo.find(session[:list_id])
    @todo_item.todo_id = list.id

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_items_path }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def move_up
    todo_item = TodoItem.find(todo_items_params_name)
    todo_item.move_higher
    todo_item.save
    redirect_to 'todo_item#index'
  end

  def move_down
    todo_item = TodoItem.find(todo_items_params_name)
    todo_item.move_lower
    todo_item.save
    redirect_to 'todo_item#index'
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_item, notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_items_path, notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      if params[:todo_item]
      @todo_item = TodoItem.find(params[:todo_item])
      else
        @todo_item = TodoItem.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:name, :position)
    end

    def todo_items_params_name
      params.require(:todo_item).permit(:id)
    end
end
