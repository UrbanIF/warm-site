class MainController < ApplicationController
  def index
    @total_news = News.count
    @news = News.for_main
    @big_projects = Project.big.order_by_weight
    @small_projects = Project.small.order_by_weight
    @static_text = StaticPage.first
  end
end
