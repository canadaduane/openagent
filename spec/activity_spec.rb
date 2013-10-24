require_relative "spec_helper"
require "openagent/agent"
require "openagent/zone"
require "openagent/sif"
require "openagent/activity"

describe OpenAgent::Activity do
  let(:agent)    { OpenAgent::Agent.from_yaml(fixture('agent.yaml')) }
  let(:zone)     { OpenAgent::Zone.from_yaml(fixture('zone.yaml')) }
  let(:sif)      { OpenAgent::SIF.new }
  let(:activity) { OpenAgent::Activity.new( agent, zone, sif ) }

  it "registers" do
    sif.guuid = "DD39ED00127F01313D6F14109FD501C1"
    sif.timestamp = "2013-10-08T13:43:44"
    xml, i = activity.create_xml('register')
    xml.should == "<SIF_Message Version=\"2.0r1\" xmlns=\"http://www.sifinfo.org/infrastructure/2.x\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>DD39ED00127F01313D6F14109FD501C1</SIF_MsgId>\n      <SIF_Timestamp>2013-10-08T13:43:44</SIF_Timestamp>\n      <SIF_SourceId>TEST_SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Name>TEST_SIF_NAME</SIF_Name>\n    <SIF_Version>2.0r1</SIF_Version>\n    <SIF_MaxBufferSize>64000</SIF_MaxBufferSize>\n    <SIF_Mode>Pull</SIF_Mode>\n  </SIF_Register>\n</SIF_Message>"
  end

  it "sends a request" do
    sif.guuid = "DD39ED00127F01313D6F14109FD501C1"
    sif.timestamp = "2013-10-08T13:43:44"
    xml, i = activity.create_xml('register')
    stub_request(:post, "http://test.zone.url/zone").
      with(:body => "<SIF_Message Version=\"2.0r1\" xmlns=\"http://www.sifinfo.org/infrastructure/2.x\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>DD39ED00127F01313D6F14109FD501C1</SIF_MsgId>\n      <SIF_Timestamp>2013-10-08T13:43:44</SIF_Timestamp>\n      <SIF_SourceId>TEST_SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Name>TEST_SIF_NAME</SIF_Name>\n    <SIF_Version>2.0r1</SIF_Version>\n    <SIF_MaxBufferSize>64000</SIF_MaxBufferSize>\n    <SIF_Mode>Pull</SIF_Mode>\n  </SIF_Register>\n</SIF_Message>",
           :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/xml', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
    response = zone.send_message(xml)
  end
end