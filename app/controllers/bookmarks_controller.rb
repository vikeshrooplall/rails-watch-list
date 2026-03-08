class BookmarksController < ApplicationController
  def new
    # find list from nested route
    @list = List.find(params[:list_id])
    # build new bookmark associated with list
    @bookmark = @list.bookmarks.new
    # Get all movies for dropdown
    @movies = Movie.all.order(:title)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: "Movie was successfully added to the list!"
    else
      @movies = Movie.all.order(:title)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list  # Get the list for redirect
    @bookmark.destroy

    redirect_to @list, notice: 'Movie was removed from the list.'
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
