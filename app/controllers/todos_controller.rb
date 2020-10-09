class TodosController < ApplicationController
    before_action :authorize_request

    def index
        @todos = @current_user.todos
        render json: @todos
    end

    def show
        @todo = Todo.find(params[:id])
        render json: @todo
    end

    def create
        @todo = Todo.new(text: params[:text], user_id: @current_user.id)

        if(@todo.save)
            render(json: { todo: @todo }, status: :ok)
        else
            render(json: { errors: todo.errors }, status: 500)
        end
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(text: params[:text], isComplete: params[:isComplete], user_id: @current_user.id)

        if(@todo.save)
            render(json: { todo: @todo }, status: :ok)
        else
            render(json: { errors: todo.errors }, status: 500)
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        render(json: { todo: @todo }, status: :ok)
    end
end