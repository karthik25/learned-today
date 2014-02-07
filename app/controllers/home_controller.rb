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

  def prev
	facts = process_xml_facts
	required_index = get_index(facts) - 1
	@fact = facts[required_index]
	redirect_to "/fact/#{@fact.file.gsub('_','-')}"
  end

  def next
	facts = process_xml_facts
	required_index = get_index(facts) + 1
	required_index = required_index == facts.length ? 0 : required_index
	@fact = facts[required_index]
	redirect_to "/fact/#{@fact.file.gsub('_','-')}"	
  end

  private

	def get_index(facts)
		current_fact = facts.detect { |f| f.file == params[:fact_url].gsub('-','_') }
		current_index = facts.find_index(current_fact)		
	end
end
