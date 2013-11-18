require_relative 'spec_helper'

describe SIF::Representation::Infra::Common::Message do
  let(:xml) { File.read(fixture("sif/sif_message__response.xml")) }
  let(:message) { SIF::Infra::Common::Message.new }
  let(:rep) { SIF::Representation::Infra::Common::Message.new(message) }

  before do
    rep.from_xml(xml)
  end

  it "parses" do
    message.version.should == "2.0r1"
  end

  it "converts to json" do
    rep.to_json
  end

end