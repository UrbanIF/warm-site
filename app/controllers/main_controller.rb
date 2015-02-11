class MainController < ApplicationController
  def index
    @total_news = News.count
    @news = News.for_main
    @big_projects = Project.big.order_by_weight
    @small_projects = Project.small.order_by_weight
    @total_projects_count = Project.visible.count
    @static_text = StaticPage.first
    @partners = Partner.all.index_by(&:position)
  end

  def markers
    markers_groups = MarkerGroup.includes(:markers).all
    render json: markers_groups.to_json(include: { markers: { include: :marker_photos } } )
  end
end
