class HomeController < ApplicationController
  include HomeHelper

  def index
	@facts = Kaminari.paginate_array(process_txt_facts)
					 .page(params[:page])
					 .per(3)
  end
end
