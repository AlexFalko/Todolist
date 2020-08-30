class TasksController < ApplicationController
 
      def index
          @tasks=Task.all
          
      end
   
      def edit
          @task = Task.find(params[:id])
      end

      def show
        @task = Task.where(todolist_id: 16).find(params[:id])
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
        @todolist = Todolist.find(params[:todolist_id])
        todolist.tasks.first.move_to_bottom
        redirect_to todolists_path
      end

      def downsort
        @todolist = Todolist.find(params[:todolist_id])
        todolist.tasks.last.move_higher
        redirect_to todolists_path
      end

     private
        def task_params
          params.require(:task).permit(:name, :status, :date_end)
        end   
end
