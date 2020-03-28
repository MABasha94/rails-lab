class PostsController < ApplicationController
    def index
        @posts = Post.all.order(updated_at: :desc)
    end

    def new
        @post = Post.new
    end


    def create
        @post = User.find(1).posts.create(post_params)
        #@post = Post.create(post_params)

        if @post.id
            redirect_to :posts
        else
          render :new
        end
        #@post = Post.new
        #@post.title = params[:title]
        #@post.content = params[:content]
        #@post.save
        #redirect_to :posts
        #redirect_to action :index, controller :users
    end

    def edit
        @post = Post.find(params[:id])
    end


    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to :posts
        else
            render :edit
        end
    end

    def show
        @post = Post.find(4)
        @comment = Comment.new
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to :posts
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
