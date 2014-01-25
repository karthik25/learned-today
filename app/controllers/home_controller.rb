class HomeController < ApplicationController
  include HomeHelper

  def index
	@facts = process_txt_facts
  end
end
