require 'spec_helper'
require 'yaml'

describe HomeHelper do    
  describe "translate yaml" do 
	it "to object" do 
		o = helper.translate_yaml(YAML::load_file(Rails.root.join 'samples/sample.yml'))
		o.should == "a sample fact"
	end
  end
end
