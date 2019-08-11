class ComicsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def create
    Comic.create(
      user_id: current_user.id,
      name: comic_params[:name],
      price: comic_params[:price],
      author: comic_params[:author],
      story: comic_params[:story]
    )
    redirect_to :action => "index"
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    comic = Comic.find(params[:id])
    comic.update(comic_params)
  end

  def destroy
    comic = Comic.find(params[:id])
    comic.delete
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :price, :author, :story)
  end

end
