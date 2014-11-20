class MainController < ApplicationController
  def index
    @total_news = News.count
    @news = News.for_main
  end
end
