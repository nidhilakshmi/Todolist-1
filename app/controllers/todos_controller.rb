class TodosController < ApplicationController
	 before_action :set_todo, only: %i[ show edit update destroy ]
	 before_action :authenticate_user!,expect: %i[index show]
	 before_action :correct_user,only: %i[ show edit update destroy]

	def index
		@todos = Todo.all
	end

	def show
   		
  end

	def new
  	@todo = current_user.todos.build
  end

 	def create
    @todo = current_user.todos.build(todo_params)
    	if @todo.save
        redirect_to todos_path, notice: "Task was successfully created"
      else
        render :new,notice: "just check something is wrong" 
	    end
	end

	def edit
	
  end

  def update
    	if @todo.update(todo_params)
      	redirect_to todos_path, notice: "Task was successfully updated"

   		else
     		render :edit
    	end

  end

	def destroy
    	@todo.destroy
    	redirect_to todos_path,notice: "Task was successfully deleted"
  end

  def correct_user
  		@todo = current_user.todos.find_by(id: params[:id])
  		redirect_to todos_path, notice: "Heyy!You are not authorized" if @todo.nil?
  end

	private

	def set_todo
			@todo = Todo.find(params[:id])
	end

  def todo_params

      params.require(:todo).permit(:task, :description, :date)

  end
end