require_relative 'spec_helper'

describe SIF::Representation::Model::Group::SIS::TermInfo do
  let(:xml) { File.read(fixture('sif/term_info.xml')) }
  let(:term_info) { SIF::Model::Group::SIS::TermInfo.new }

  before do
    SIF::Representation::Model::Group::SIS::TermInfo.new(term_info).from_xml(xml)
  end

  it 'parses' do
    term_info.ref_id.should == '7E59D75101A80A70016375DE097A0726'
    term_info.school_info_ref_id.should == 'A2E35B359D75101A8C3D00AA001A0000'
    term_info.school_year.should == '2004'
    term_info.start_date.to_s.should == '2003-01-05'
    term_info.end_date.to_s.should == '2004-04-01'
    term_info.description.should == 'Spring Semester 2004'
    term_info.relative_duration.should == 0.1333
    term_info.term_code.should == 'Sp2004'
    term_info.track.should == 'PreK'
    term_span = term_info.term_span
      term_span.code.should == '0828'
      term_span.other_codes[0].value.should == 'Semester'
      term_span.other_codes[0].code_set.should == 'Text'
  end
end