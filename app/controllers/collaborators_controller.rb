class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
    email = params[:email]
    u = User.where(email: email).first
    if !u
      flash[:error] = "No user associated with this email."
      render template: "wikis/show"
      return
    end

    if @wiki.collaborators.where(user_id: u.id).first
      flash[:error] = "Already a collaborator."
      render template: "wikis/show"
      return
    end

    # @collaborator = u.collaborators.build(wiki_id: @wiki.id)
    # if @collaborator.save
    #   flash[:notice] = "Collaborator added."
    #   redirect_to [@wiki]
    # else
    #   flash[:error] = "Something wrong happened."
    #   render template: "wikis/show"
    # end
  end

  private

end
