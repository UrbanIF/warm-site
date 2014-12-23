class FaqController < ApplicationController
  def show
    @faq = Faq.first
  end
end
