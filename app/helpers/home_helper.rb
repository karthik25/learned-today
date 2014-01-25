module HomeHelper
	def process_txt_facts
		@files = procdir(Rails.root.join 'facts/txt')
		@facts = Array.new
		@files.each do |file|
			@fact = create_fact(file)
			@facts.push(@fact)
		end
		@facts		
	end
	
	def process_facts
		@files = procdir(Rails.root.join 'facts/yml')
		@facts = Array.new
		@files.each do |file|
			@fact = translate_yaml(YAML::load_file(file))
			@facts.push(@fact)
		end
		@facts
	end

	def create_fact(file)
		n_fact = Fact.new
		n_fact.fact = read_file(file)
		n_fact.date = read_file_date(file)
		n_fact
	end

	def translate_yaml(yml)
		n_fact = Fact.new
		n_fact.fact = yml["fact"]
		n_fact.date = yml["date"]
		n_fact
	end

	private
		def procdir(dir)
		  files = Dir[ File.join(dir, '**', '*') ].reject { |p| File.directory? p }
		  files = files.sort_by { |file| File.ctime(file) }
		  files.reverse
		end

		def read_file(file)
			f = File.open(file)
			f.read
		end

		def read_file_date(file)
			mtime = File.ctime(file)
			date_str = "#{mtime.month}/#{mtime.day}/#{mtime.year}"
		end
end
