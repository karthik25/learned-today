require 'spec_helper'
require 'yaml'

describe HomeHelper do    
  describe "translate yaml" do 
	it "to object" do 
		o = helper.translate_yaml(YAML::load_file(Rails.root.join 'samples/sample.yml'))
		expect(o.fact).to eq "a sample fact"
		expect(o.date).to eq "01-24-2014"
	end
  end

  describe "translate xml" do 
	it "to object" do 
		o = helper.translate_xml(Rails.root.join 'samples/sample.xml')
		expect(o.fact).to eq "some sample content"
		expect(o.date).to eq "01/24/2014"
		expect(o.file).to eq "sample"
	end
  end
end
