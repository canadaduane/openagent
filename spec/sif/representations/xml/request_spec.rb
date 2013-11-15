require_relative 'spec_helper'

describe SIF::Representation::Infra::Message::Request do
  let(:xml) { File.read(fixture("sif/sif_request.xml")) }
  let(:request) { SIF::Infra::Message::Request.new }

  before do
    SIF::Representation::Infra::Message::Request.new(request).from_xml(xml)
  end

  it "parses" do
    request.version.should == "2.*"
    request.max_buffer_size.should == 1048576
    request.query.query_object.object_name.should == "LibraryPatronStatus"
    request.query.condition_group.conditions.size.should == 1
  end
end