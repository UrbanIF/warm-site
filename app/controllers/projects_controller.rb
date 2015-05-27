class ProjectsController < ApplicationController
  def show
    @project = Project.find_by_slug params[:slug]
  end

  def show_news
    @news = Project.find_by_slug(params[:slug]).news.order_by_date.group_by do |news|
      I18n.l(news.date, format: '%B %Y')
    end

    render 'news/index'
  end
end
