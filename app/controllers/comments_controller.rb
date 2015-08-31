class CommentsController < ApplicationController
  def create
    @collaborator = Collaborator.find_by(user_id: current_user.id)
    @wiki = Wiki.find(params[:wiki_id])

    @comment = @collaborator.comments.build(comment_params)
    @comment.wiki = @wiki
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to @wiki
    else
      flash[:error] = "Wasnt saved"
      render :back
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @comment = @wiki.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "The comment was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There seems to be a problem."
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
