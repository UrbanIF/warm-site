class PublicationsController < ApplicationController

  def index
    @publications = Publication.order_by_date.group_by do |publication|
      I18n.l(publication.date, format: '%B %Y')
    end
  end
  
end
