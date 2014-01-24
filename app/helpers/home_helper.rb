module HomeHelper
	def translate_yaml(yml)
		n_fact = Fact.new
		n_fact.fact = yml["fact"]
		n_fact.date = yml["date"]
		n_fact
	end
end
