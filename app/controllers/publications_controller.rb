class PublicationsController < ApplicationController
  def index
    @publications = prepare_objects_dates(Publication)
  end
end
