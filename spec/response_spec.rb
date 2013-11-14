require_relative "spec_helper"
require "openagent/client"

describe OpenAgent::Client do
  let(:response) { SIF::Infra::Common::Message.new }
  let(:xml) {File.read('./spec/fixtures/sif/stu_pers_resp.xml')}

  before do
    representer = SIF::Representation::XML::Infra::Common::Message
    @msg = representer.new(response).from_xml(xml)
  end

  it "has packet nums" do
    @msg.inner_message.response.packet_number.should == 1
  end

  it "has more packets" do
    @msg.inner_message.response.more_packets?.should be_true
  end

  it "has students" do
    @msg.inner_message.response.object_data.objects.count.should_not be_nil
  end

  it "has students ref_ids" do
    ref_ids = []
    @msg.inner_message.response.object_data.objects.each do |student|
      ref_ids << student.ref_id
    end
  end
end