class HomeController < ApplicationController
  include HomeHelper

  def index
	@facts = Kaminari.paginate_array(process_xml_facts)
					 .page(params[:page])
					 .per(5)
  end
end
