class TasksController < ApplicationController
      
      def edit
          @task = Task.find(params[:id])
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
    
      
     private
        def task_params
          params.permit(:name, :status)
        end   
          
          
end
