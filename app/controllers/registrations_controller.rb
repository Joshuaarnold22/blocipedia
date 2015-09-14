class RegistrationsController < Devise::RegistrationsController

  def edit
    @user = current_user
    @wikis = @user.wikis
    @comments = @user.comments

    super
  end

end
