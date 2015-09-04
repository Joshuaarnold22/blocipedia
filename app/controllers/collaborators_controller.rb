class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = Collaborator.new
    email = params[:email]
    u = User.where(email: email).first
    if !u
      @collaborator.errors.add(:email, "No user associated with this email.")
      render template: "wikis/show"
      return
    end

    @collaborator = u.collaborators.build(wiki_id: @wiki.id)
    if @collaborator.save
      flash[:notice] = "Collaborator added."
      redirect_to [@wiki]
    else
      render template: "wikis/show"
    end
  end

  private

end
