class MediaPartnersController < ApplicationController
  def index
    @partners = Partner.all.index_by(&:position)
    @media_partners = MediaPartner.all
  end
end
