require_relative 'spec_helper'

describe SIF::Representation::XML::Request do
  let(:xml) { File.read(fixture("sif_request.xml")) }
  let(:request) { SIF::Message::Request.new }

  before do
    SIF::Representation::XML::Request.new(request).from_xml(xml)
  end

  it "parses" do
    request.version.should == "2.*"
    request.max_buffer_size.should == 1048576
    request.query.query_object.object_name.should == "LibraryPatronStatus"
    request.query.condition_group.conditions.size.should == 1
  end
end