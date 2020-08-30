class TasksController < ApplicationController
 
      def index
          @tasks=Task.all
          
      end
   
      def edit
          @task = Task.find(params[:id])
      end

      def show
        @task = Task.where(id: params[:id])
      end

      def update
        @task = Task.find(params[:id])   
        if @task.update(task_params)
          redirect_to todolists_path      
        else
          render 'edit'
        end
      end

      def create
        @todolist = Todolist.find(params[:todolist_id])
        @task = @todolist.tasks.create(task_params)
        redirect_to todolists_path
      end

      def destroy
        @todolist = Todolist.find(params[:todolist_id])
        @task = @todolist.tasks.find(params[:id])
        @task.destroy
        redirect_to todolists_path
      end

      def upsort
        task = Task.find_by(id: params[:id])
        task.move_higher
        redirect_to root_path
      end

      def downsort
        task = Task.find_by(id: params[:id])
        task.move_lower
        redirect_to root_path
      end

     private
        def task_params
          params.require(:task).permit(:name, :status, :date_end)
        end   
end
