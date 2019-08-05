class ComicsController < ApplicationController

  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def create
    Comic.create(comic_params)
    redirect_to :action => "index"
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    comic = Comic.find(params[:id])
    comic.update(comic_params)
    redirect_to :action => "index"
  end

  def destroy
    comic = Comic.find(params[:id])
    comic.delete
    redirect_to :action => "index"
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :price, :author)
  end

end
