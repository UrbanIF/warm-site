class NewsController < ApplicationController
  def index
    @news = News.global.order_by_date.group_by do |news|
      I18n.l(news.date, format: '%B %Y')
    end
  end

  def show
    @news = News.find_by_slug(params[:id])
  end
end
