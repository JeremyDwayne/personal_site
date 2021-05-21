module Authors
  class PostElementsController < AuthorsController
    before_action :set_post
    before_action :set_post_element, only: [:update, :destroy]

    # POST /post_elements
    def create
      @post_element = @post.post_elements.build(post_element_params)

      notice = @post_element.save ? @post_element.errors.full_messages.join(". ") : nil
      redirect_to edit_post_path(@post), notice: notice
    end

    # PATCH/PUT /post_elements/1
    def update
      @post_element.update(post_element_params)
      redirect_to edit_post_path(@post_element.post)
    end

    # DELETE /post_elements/1
    def destroy
      @post_element.destroy
      redirect_to edit_post_path(@post_element.post) , notice: 'Post element was successfully destroyed.'
    end

    private
    def set_post
      @post = current_author.posts.find(params[:post_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post_element
      @post_element = @post.post_elements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_element_params
      params.require(:post_element).permit(:element_type, :content, :image)
    end
  end
end
