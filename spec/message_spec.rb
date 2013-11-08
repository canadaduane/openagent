require_relative 'spec_helper'

describe OpenAgent::Message do

  let(:sif_event_xml) { File.read(fixture("messages/event.xml")) }
  let(:sif_response_xml) { File.read(fixture("messages/response.xml")) }

  context "event" do
    let(:wrap_msg) { OpenAgent::Message::SIF_Ack::SIF_Message.from_xml(sif_event_xml) }
    let(:message) { wrap_msg.inner_message }

    it "detects SIF_Event" do
      message.type.should == :event
    end

    it "gets msgid" do
      message.msgid.should == "1BD67F9593DC4867AD8A341F0EC7886C"
      message.event.header.msgid.should == "1BD67F9593DC4867AD8A341F0EC7886C"
    end

    it "gets timestamp" do
      message.timestamp.should == DateTime.parse("2013-10-08T11:36:06-06:00")
      message.event.header.timestamp.should == DateTime.parse("2013-10-08T11:36:06-06:00")
    end
  end

  context "event" do
    let(:wrap_msg) { OpenAgent::Message::SIF_Ack::SIF_Message.from_xml(sif_response_xml) }
    let(:message) { wrap_msg.inner_message }
    
    it "detects SIF_Response" do
      message.type.should == :response
    end

    it "gets msgid" do
      message.msgid.should == "026340A188BA4EAF97C0D42E37F1302C"
      message.response.header.msgid.should == "026340A188BA4EAF97C0D42E37F1302C"
    end

    it "gets timestamp" do
      message.timestamp.should == DateTime.parse("2013-10-09T10:19:20-06:00")
      message.response.header.timestamp.should == DateTime.parse("2013-10-09T10:19:20-06:00")
    end
  end

  it "has an OpenAgent::Message() shortcut" do
    lambda { OpenAgent::Message(sif_event_xml) }.should_not raise_error
  end

end