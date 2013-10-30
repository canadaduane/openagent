require 'representable/json'
require 'representable/xml'




# class MessageXML < Representable::Decorator
#   include Representable::XML
#   property :
# end


class UserRepresentation < Representable::Decorator
  include Representable::JSON
  include Representable::XML

  self.representation_wrap = "userspace"

  property :first_name
  property :last_name
  property :login
  property :email
  property :active
end

class User
  attr_accessor :first_name, :last_name, :login, :email, :active

  def initialize(attrs={})
    [:first_name, :last_name, :login, :email, :active].each do |key|
      instance_variable_set "@#{key}", attrs[key]
    end
  end
end

$u = User.new(:first_name => "Duane")
$ur = UserRepresentation.new($u)

# $h = Header.new
# $hr = HeaderRepresentation.new($h)

$xml = <<-XML
  <SIF_Event>
    <SIF_Header>
      <SIF_MsgId>1BD67F9593DC4867AD8A341F0EC7886C</SIF_MsgId>
      <SIF_Timestamp>2013-10-08T11:36:06-06:00</SIF_Timestamp>
      <SIF_SourceId>test</SIF_SourceId>
      <SIF_DestinationId>canvas</SIF_DestinationId>
    </SIF_Header>
  </SIF_Event>
XML

$xml_message = <<-XML
<SIF_Message xmlns="http://www.sifinfo.org/infrastructure/2.x" Version="2.0r1">
  <SIF_Ack>
    <SIF_Header>
      <SIF_MsgId>44353D742D7F42F6A5AEEDCF4F661710</SIF_MsgId>
      <SIF_Timestamp>2013-10-08T13:19:15-06:00</SIF_Timestamp>
      <SIF_SourceId>canvas</SIF_SourceId>
    </SIF_Header>
    <SIF_OriginalSourceId>canvas</SIF_OriginalSourceId>
    <SIF_OriginalMsgId>CBAEC920127C01319D7D48E0EB1826A1</SIF_OriginalMsgId>
    <SIF_Status>
      <SIF_Code>0</SIF_Code>
      <SIF_Data>
        <SIF_Message Version="2.0r1" xmlns="http://www.sifinfo.org/infrastructure/2.x">
          <SIF_Event>
            <SIF_Header>
              <SIF_MsgId>1BD67F9593DC4867AD8A341F0EC7886C</SIF_MsgId>
              <SIF_Timestamp>2013-10-08T11:36:06-06:00</SIF_Timestamp>
              <SIF_SourceId>test</SIF_SourceId>
              <SIF_DestinationId>canvas</SIF_DestinationId>
            </SIF_Header>
            <SIF_ObjectData>
              <SIF_EventObject Action="Add" ObjectName="StudentPersonal">
                <StudentPersonal RefId="D3E34B359D75101A8C3D00AA001A1652">
                  <AlertMessages>
                    <AlertMessage Type="Legal">This is the Legal Alert for Joe Student</AlertMessage>
                  </AlertMessages>
                  <LocalId>P00001</LocalId>
                  <StateProvinceId>WB0025</StateProvinceId>
                  <ElectronicIdList>
                    <ElectronicId Type="Barcode">206654</ElectronicId>
                  </ElectronicIdList>
                  <Name Type="04">
                    <LastName>Student</LastName>
                    <FirstName>Joe</FirstName>
                    <MiddleName/>
                    <PreferredName>Joe</PreferredName>
                  </Name>
                  <Demographics>
                    <Gender>M</Gender>
                  </Demographics>
                  <AddressList>
                    <Address Type="0123">
                      <Street>
                        <Line1>6799 33rd Ave.</Line1>
                        <StreetNumber>6799</StreetNumber>
                        <StreetName>33rd</StreetName>
                        <StreetType>Ave.</StreetType>
                      </Street>
                      <City>Chicago</City>
                      <StateProvince>IL</StateProvince>
                      <Country>US</Country>
                      <PostalCode>60660</PostalCode>
                    </Address>
                  </AddressList>
                  <PhoneNumberList>
                    <PhoneNumber Type="0096">
                      <Number>(312) 555-1234</Number>
                    </PhoneNumber>
                  </PhoneNumberList>
                  <EmailList>
                    <Email Type="Primary">Joe.Student@anyschool.com</Email>
                  </EmailList>
                  <OnTimeGraduationYear>2007</OnTimeGraduationYear>
                </StudentPersonal>
              </SIF_EventObject>
            </SIF_ObjectData>
          </SIF_Event>
        </SIF_Message>
      </SIF_Data>
    </SIF_Status>
  </SIF_Ack>
</SIF_Message>
XML