class TodosController < ApplicationController
  before_action :find_todo, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      redirect_to root_path, notice:'No guardado'
    end
  end

  def show
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to root_path
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  def complete
    @todo.completed = true
    @todo.save
    redirect_to root_path
  end

  def list
    @todos = Todo.all
    @todos_completados = Todo.where(completed: true)
    @todos_no_completados = Todo.where(completed: [false, nil])
  end

  private
  def todo_params
    params.require(:todo).permit(:description)
  end

  def find_todo
  @todo = Todo.find(params[:id])
  end


end
