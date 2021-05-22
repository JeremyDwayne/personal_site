module Authors
  class ElementsController < AuthorsController
    before_action :set_post
    before_action :set_element, only: [:update, :destroy]

    # POST /elements
    def create
      @element = @post.elements.build(element_params)

      notice = @element.save ? @element.errors.full_messages.join(". ") : nil
      redirect_to edit_post_path(@post), notice: notice
    end

    # PATCH/PUT /elements/1
    def update
      @element.update(element_params)
    end

    # DELETE /elements/1
    def destroy
      @element.destroy
      redirect_to edit_post_path(@element.post) , notice: 'Element was successfully destroyed.'
    end

    private
    def set_post
      @post = current_author.posts.find(params[:post_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = @post.elements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def element_params
      params.require(:element).permit(:element_type, :content, :image)
    end
  end
end
