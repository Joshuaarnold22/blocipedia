class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    if @wiki.save
      flash[:notice] = "Wiki was saved"
      redirect_to @wiki
    else
      flash[:error] = "Too bad"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "Another error."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There seems to be a problem."
      render :show
    end
  end
end
