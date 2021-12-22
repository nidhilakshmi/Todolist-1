class TodosController < ApplicationController

	def index
		@todos =Todo.all
	end

	def show
   		@todo = Todo.find(params[:id])
  	end

  	def new
    	@todo = Todo.new
    end

    def create
    	@todo = Todo.new(todo_params)

        if @todo.save
          redirect_to todos_path, notice: "Task was successfully created"
        else
          render :new 
 	      end
	end

	private

  	def todo_params

      	params.require(:todo).permit(:task, :description, :date)

  	end


end
