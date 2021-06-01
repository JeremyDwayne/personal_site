module Readers
  # Public Blog Posts Controller
  class PostsController < ReadersController
    def show
      @post = Post.published.friendly.find(params[:id])
      impressionist(@post)
    end
  end
end
