require 'nokogiri'

module HomeHelper
	def process_xml_facts
		@files = procdir(Rails.root.join 'facts/xml')
		@facts = Array.new
		@files.each do |file|
			@fact = translate_xml(file)
			@facts.push(@fact)
		end
		@facts = @facts.sort_by! {
			|fact| Date.strptime(fact.date, "%m/%d/%Y")
		}
		@facts.reverse!
	end
	
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

	def translate_xml(xml)
		n_fact = Fact.new
		xml_parsed = Nokogiri::XML(File.open(xml).read)
		n_fact.fact = get(xml_parsed, "content")
		n_fact.date = get(xml_parsed, "date")
		n_fact
	end

	private
		def procdir(dir)
		  files = Dir[ File.join(dir, '**', '*') ].reject { |p| File.directory? p }
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

		def get(xml_parsed, node_name)
			node = xml_parsed.xpath("//#{node_name}").first
			node.content.gsub(/\n\s+/, "")
		end
end
