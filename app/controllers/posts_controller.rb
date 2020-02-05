class PostsController < ApplicationController

    def index

        @posts = Post.all        
    end

    def new
        @post = Post.new
    end

    def create
        
        @post = Post.new(post_params) #the post params are created by the "private" function. You could use params[:id] or whatever hash but you want to make sure that certain data is entered and required for organisational and security reasons.
        @post.user_id = current_user.id
        if @post.save
            redirect_to @post
            flash[:notice] = "Post created" #the if is used to check if everything worked. It is used for debugging purposes. It would work without it. At the moment there is no difference between notice and alert but the difference will be, that you can style them differently.
        else
            redirect_back(fallback_location: root)
            flash[:alert] = "Post creation failed"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:caption, :image)
    end
end