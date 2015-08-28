class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:collaborator][:wiki_id])
    @collaborator = Collaborator.new
    email = params[:email]
    u = User.where(email: email).first
    if !u
      flash[:error] = "No user associated with this email."
      render template: "wikis/show"
      return
    end

    @collaborator = u.collaborators.build(collaborator_params)
    if @collaborator.save
      flash[:notice] = "Collaborator added."
      redirect_to [@wiki]
    else
      flash[:error] = "Something wrong happened."
      render :back
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:email, :wiki_id)
  end

end
