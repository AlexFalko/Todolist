class TodolistsController < ApplicationController

    def index
        @todolists = Todolist.all 
        
                   
    end

    def show
      @todolist = Todolist.find(params[:id])
    end

    def new
        @todolist = Todolist.new
    end

    def edit
        @todolist = Todolist.find(params[:id])
    end
   
    def create
        @todolist = Todolist.new(title: "Project")
        if @todolist.save
         redirect_to todolists_path
        else
            render 'new'
        end
    end

    def update
        @todolist = Todolist.find(params[:id])     
        if @todolist.update(todolist_params)
          redirect_to todolists_path      
        else
          render 'edit'
        end
      end
    
      def destroy
        @todolist = Todolist.find(params[:id])
        @todolist.destroy
        redirect_to todolists_path
      end


    private
        def todolist_params
             params.require(:todolist).permit(:title, :text)
        end
    

end
