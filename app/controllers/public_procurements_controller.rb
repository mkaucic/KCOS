class PublicProcurementsController < ApplicationController
  before_action :years_calc 
  def index
    @public_procurements = PublicProcurement.all
  end

  def years_calc
    @pp_year = PublicProcurement.pluck(:year).uniq.sort
  end
end
