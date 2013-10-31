require_relative 'spec_helper'

describe SIF::Representation::XML::Response do
  let(:xml) { File.read(fixture("sif_response.xml")) }
  let(:response) { SIF::Message::Response.new }

  before do
    SIF::Representation::XML::Response.new(response).from_xml(xml)
  end

  it "parses" do
    response.request_msg_id.should == "FE1078BA3261545A319059376B3A4898"
    response.more_packets.should_not be_true
    # response.object_data
  end
end