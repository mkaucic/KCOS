class PagesController < ApplicationController

  def home
    @navigation_is_transparent = true
    @home_text =  HomeStaticText.first
  end

  def contact
    @contact = ContactInfo.first
  end

  def gdpr
  	@text = Legal.first.gdpr
  end

  def privacy_policy
  	@text = Legal.first.privacy_policy
  end

  def impresum 
  	@text = Legal.first.impresum
  end

  def legal_pages
    @privacy_policy = Legal.first.privacy_policy
    @impresum = Legal.first.impresum
    @gdpr = Legal.first.gdpr
  end
end
