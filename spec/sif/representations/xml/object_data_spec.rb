require_relative 'spec_helper'

describe SIF::Representation::XML::Infra::Common::ObjectData do
  let(:xml) { File.read(fixture("sif/sif_object_data.xml")) }
  let(:object_data) { SIF::Infra::Common::ObjectData.new }

  before do
    SIF::Representation::XML::Infra::Common::ObjectData.new(object_data).
      from_xml(xml)
  end

  it "parses" do
    object_data.objects.count.should == 3
  end
end
