require_relative "spec_helper"
require "openagent/client"

def stub_rr(request, response)
  stub_request(:post, "http://localhost:8765/").
    with(:body => request,
         :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/xml', 'User-Agent'=>'Ruby'}).
    to_return(:status => 200, :body => response, :headers => {})
end

describe OpenAgent::Client do

  context "agent options" do
    let(:agent)  { OpenAgent::Agent.new(YAML::load(File.read(fixture('agent.yaml')))) }
    let(:zone)   { OpenAgent::Zone.new(YAML::load(File.read(fixture('zone.yaml')))) }
  end

  subject(:client) {
    OpenAgent::Client.new(
      :name => "canvas",
      :url => "http://localhost:8765",
      :logger => Logger.new(EmptyLogger.new)
    ).tap do |client|
      client.builder.guuid = "MSG_ID"
      client.builder.timestamp = "TIMESTAMP"
    end
  }

  it "initializes" do
    client.name.should == "canvas"
    client.url.should == "http://localhost:8765"
  end

  it "initializes the agent" do
    client.agent.tap do |a|
      a.name.should == "canvas"
      a.source_id.should == "canvas"
      a.msg_version.should == "2.0r1"
    end
  end

  it "initializes the zone" do
    client.zone.tap do |z|
      z.url.host.should == "localhost"
    end
  end

  context "run loop" do
    it "no message exits loop" do
      client.stub(:get_message) { nil }
      client.run_once
    end

    it "ZIS_NO_MESSAGES exits loop" do
      stub_rr(File.read(fixture("messages/get_message.xml")),
              File.read(fixture("messages/response.xml")))
      stub_rr(File.read(fixture("messages/get_message.xml")),
              File.read(fixture("messages/response_done.xml")))
      client.run_once
    end

    it "empty body raises ResponseError" do
      stub_rr(File.read(fixture("messages/get_message.xml")), "")
      lambda { client.run_once }.should raise_error(OpenAgent::ResponseError)
    end
  end

  context "given a response message" do
    let(:message) do
      SIF::Infra::Common::Message.new(
        :ack => SIF::Infra::Message::Ack.new(
          :header => SIF::Infra::Common::Header.new(
            :msg_id => "D72C57",
            :timestamp => "2013-10-09T10:42:16-06:00",
            :source_id => "canvas"
          ),
          :original_source_id => "canvas",
          :original_msg_id => "088E68",
          :status => SIF::Infra::Common::Status.new(
            :code => 0
          )
        )
      )
    end

    it "checks for errors" do
      lambda { client.send(:check_for_errors, message) }.should_not \
        raise_error
    end

    it "raises error on status code" do
      message.ack.status.code = 7
      lambda { client.send(:check_for_errors, message) }.should \
        raise_error(OpenAgent::SIFCodeError)
    end

    it "raises error if SIF_Error present" do
      message.ack.error = SIF::Infra::Common::Error.new(
        :category => 0,
        :code => 1,
        :desc => "Unknown SIF_Error error"
      )
      lambda { client.send(:check_for_errors, message) }.should \
        raise_error(OpenAgent::SIFError)
    end
  end

  # it "acks" do
  #   stub_request(:post, "http://localhost:8765/").
  #        with(:body => "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Ack>\n    <SIF_OriginalSourceId>ORIG_SRC_ID</SIF_OriginalSourceId>\n    <SIF_OriginalMsgId>ORIG_MSG_ID</SIF_OriginalMsgId>\n    <SIF_Header>\n      <SIF_MsgId>MSG_ID</SIF_MsgId>\n      <SIF_Timestamp>TIMESTAMP</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Status>\n      <SIF_Code>1</SIF_Code>\n    </SIF_Status>\n  </SIF_Ack>\n</SIF_Message>",
  #             :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/xml', 'User-Agent'=>'Ruby'}).
  #        to_return(:status => 200, :body => "", :headers => {})

  #   client.builder.guuid = "MSG_ID"
  #   client.builder.timestamp = "TIMESTAMP"
  #   client.ack("ORIG_SRC_ID", "ORIG_MSG_ID") do |*args|
  #     p args
  #   end
  #   # xml.should == "<SIF_Message Version=\"2.0r1\" xmlns=\"http://www.sifinfo.org/infrastructure/2.x\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>DD39ED00127F01313D6F14109FD501C1</SIF_MsgId>\n      <SIF_Timestamp>2013-10-08T13:43:44</SIF_Timestamp>\n      <SIF_SourceId>TEST_SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Name>TEST_SIF_NAME</SIF_Name>\n    <SIF_Version>2.0r1</SIF_Version>\n    <SIF_MaxBufferSize>64000</SIF_MaxBufferSize>\n    <SIF_Mode>Pull</SIF_Mode>\n  </SIF_Register>\n</SIF_Message>"
  # end

  # it "sends a request" do
  #   sif.guuid = "DD39ED00127F01313D6F14109FD501C1"
  #   sif.timestamp = "2013-10-08T13:43:44"
  #   xml, i = activity.create_xml('register')
  #   stub_request(:post, "http://test.zone.url/zone").
  #     with(:body => "<SIF_Message Version=\"2.0r1\" xmlns=\"http://www.sifinfo.org/infrastructure/2.x\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>DD39ED00127F01313D6F14109FD501C1</SIF_MsgId>\n      <SIF_Timestamp>2013-10-08T13:43:44</SIF_Timestamp>\n      <SIF_SourceId>TEST_SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Name>TEST_SIF_NAME</SIF_Name>\n    <SIF_Version>2.0r1</SIF_Version>\n    <SIF_MaxBufferSize>64000</SIF_MaxBufferSize>\n    <SIF_Mode>Pull</SIF_Mode>\n  </SIF_Register>\n</SIF_Message>",
  #          :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/xml', 'User-Agent'=>'Ruby'}).
  #     to_return(:status => 200, :body => "", :headers => {})
  #   response = zone.send_message(xml)
  # end
end