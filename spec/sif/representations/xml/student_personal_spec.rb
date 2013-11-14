require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::StudentPersonal do
#  let(:xml) { File.read(fixture("sif/student_personal.xml")) }
#  let(:student) { SIF::Model::Group::SIS::StudentPersonal.new }

#  before do
#    SIF::Representation::XML::Model::Group::SIS::StudentPersonal.new(student).
#      from_xml(xml)
#  end

  it "justworks" do
    jwxml = <<-myxml
      <user>
        <addresses>
          <address type="01">123 Street</address>
          <address>123 Street</address>
          <address type="02">Cardboard Box</address>
          <address>Cardboard Box</address>
          <address>10</address>
        </addresses>
      </user>
    myxml


    class Address
      include Virtus.model

      attribute :type,  String
      attribute :value, String
      attribute :asint, Integer
    end

    class User
      include Virtus.model
      attribute :addresses, Array[Address]
    end

    class AddressRep < Representable::Decorator
      include Representable::XML
      self.representation_wrap = :address
      property :type, :attribute => true
      property :value, :as => 'address', :content => true
      property :asint, :as => 'address', :content => true
    end

    class UserRep < Representable::Decorator
      include Representable::XML
      self.representation_wrap = :user
      collection :addresses, :as => :address, :wrap => :addresses,
                 :class => Address, :decorator => AddressRep
    end

    user = User.new;
    UserRep.new(user).from_xml(jwxml)
    require 'debugger'; debugger
    user.addresses.should_not == nil

  end

#  it "parses" do
#    SIF::Representation::XML::Model::Group::SIS::StudentPersonal.new(student).from_xml(xml);
#    student.ref_id.should == "D3E34B359D75101A8C3D00AA001A1652"
#    messages = student.alert_messages
#    for message in messages
#      message.type.should == "Legal"
#      #message.value.should == "This is the Legal Alert for Joe Student"
#    end
#  end
end