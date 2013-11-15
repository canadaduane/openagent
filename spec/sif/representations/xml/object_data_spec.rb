require_relative 'spec_helper'

describe SIF::Representation::Infra::Common::ObjectData do
  let(:xml) { File.read(fixture("sif/sif_object_data.xml")) }
  let(:object_data) { SIF::Infra::Common::ObjectData.new }

  before do
    SIF::Representation::Infra::Common::ObjectData.new(object_data).from_xml(xml)
  end

  it "parses" do
    object_data.student_personals.count.should == 3
    object_data.objects.count.should == 3
  end

  it "has a datatype" do
    object_data.datatype.should == :student_personal
  end
end
