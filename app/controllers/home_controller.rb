class HomeController < ApplicationController
  include HomeHelper

  def index
	@facts = Kaminari.paginate_array(process_xml_facts)
					 .page(params[:page])
					 .per(5)
  end

  def show
	facts = process_xml_facts
	@fact = facts.detect { |f| f.file == params[:fact_url].gsub('-','_') }
  end
end
