require_relative 'spec_helper'

describe SIF::Representation::Infra::Message::Response do
  let(:xml) { File.read(fixture("sif/sif_response.xml")) }
  let(:response) { SIF::Infra::Message::Response.new }

  before do
    SIF::Representation::Infra::Message::Response.new(response).from_xml(xml)
  end

  it "parses" do
    response.request_msg_id.should == "FE1078BA3261545A319059376B3A4898"
    response.more_packets.should_not be_true
    # response.object_data
  end
end