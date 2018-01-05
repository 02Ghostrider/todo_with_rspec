class TasksController < ApplicationController
	
	before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

	def index
		@tasks = Task.all
	end

	def show
	end

	def new
		@task = Task.new
	end

	def edit
	end

	def create
		@task = Task.create(task_params)
		@task.save

		respond_to do |format|
			if @task.save
				format.html {redirect_to task_path(@task)}
			else
				format.html {render :new}
			end
		end
	end

	def update
		respond_to do |format|
	    if @task.update(task_params)
	      format.html { redirect_to task_path(@task) }
	    else
	       format.html { render :edit }
	    end
	  end
	end

	def destroy
		@task.destroy
	  respond_to do |format|
	    format.html { redirect_to tasks_path }
	  end
	end

	private

	def set_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:name, :priority, :due_date, :user_id)
	end

end
