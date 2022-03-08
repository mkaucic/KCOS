class DocumentsController < ApplicationController
	before_action :years_calc 
  def index
    @documents = Document.all
  end

  def years_calc
    @d_year = Document.pluck(:year).uniq.sort
  end
end
