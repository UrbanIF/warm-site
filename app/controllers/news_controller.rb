class NewsController < ApplicationController
  def index
    @news = prepare_objects_dates(News)
  end

  def show
    @news = News.find_by_slug(params[:id])
  end
end
