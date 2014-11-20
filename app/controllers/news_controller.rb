class NewsController < ApplicationController
  def index
    @news = prepare_objects_dates(News)
  end

  def show
    @news = News.find(params[:id])
  end
end
