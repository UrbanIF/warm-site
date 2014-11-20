class HomeController < ApplicationController
  def index
    static_page = StaticPage.all.first
    news = News.all
    project = Project.all

  end
end
