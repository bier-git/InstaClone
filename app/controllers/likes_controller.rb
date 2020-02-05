class LikesController < ApplicationController
    def new
        @like = Like.new
    end

    def create
        @like = Like.new
        @like.user_id = current_user.id
        @like.post_id = params[:post_id]
        @like.save
    end

end