require_relative "spec_helper"
require "openagent/client"


describe OpenAgent::Client do
  let(:message) { SIF::Infra::Common::Message.new }
  let(:grading_assignment_xml) {File.read('./spec/fixtures/sif/grading_assignment.xml')}
  let(:grading_assignment_score_xml) {File.read('./spec/fixtures/sif/grading_assignment_score.xml')}
  let(:agent) { OpenAgent::Agent.new(YAML::load(File.read(fixture("agent.yaml")))) }
  let(:zone) { OpenAgent::Zone.new(YAML::load(File.read(fixture("zone.yaml")))) }

  let(:builder) { OpenAgent::MessageBuilder.new(agent, zone) }
  let(:guuid) { OpenAgent::MessageBuilder.guuid }

  before do
    builder.stub(:guuid) { "GUUID" }
    builder.stub(:timestamp) { "TIME" }
    builder.stub(:sourceid) {"SOURCEID"}
    grade_assignment_object_model = SIF::Model::Group::Grades::GradingAssignment.new
    @grade_assignment_score_object_model = SIF::Model::Group::Grades::GradingAssignmentScore.new
    @grade_assignment_object_rep = SIF::Representation::Model::Group::Grades::GradingAssignment.new(grade_assignment_object_model).from_xml(grading_assignment_xml)
    @grade_assignment_score_object_rep = SIF::Representation::Model::Group::Grades::GradingAssignmentScore.new(@grade_assignment_score_object_model).from_xml(grading_assignment_score_xml)
    @event_message = SIF::Representation::Infra::Common::Message.new(@event_object_rep)

  end

  it "creates GradingAssignment event object" do

    event = builder.event('GradingAssignment','Add',@grade_assignment_object_rep)
    event_rep = SIF::Representation::Infra::Common::Message.new(event).to_xml
    event_rep.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Event>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_ObjectData>\n      <SIF_EventObject ObjectName=\"GradingAssignment\" Action=\"Add\">\n        <GradingAssignment RefId=\"359D75101AD0A9D7A8C3DAD0A85103A2\" SectionInfoRefId=\"D0A0A27AD0A8510AD9D75101A8C3DA39\" TermInfoRefId=\"A8C3A2E35B359D75101D00AA001A0000\" SchoolInfoRefId=\"11737EA4301CADCA75C87214A7C46BDB\" GradingCategoryRefId=\"98A57A0013BA8C3D00AA012B359D751A\">\n          <Description>Pop Quiz</Description>\n          <PointsPossible>100</PointsPossible>\n          <CreateDate>2000-11-21</CreateDate>\n          <DueDate>2000-11-25</DueDate>\n          <Weight>1.0</Weight>\n          <SIF_ExtendedElements/>\n        </GradingAssignment>\n      </SIF_EventObject>\n    </SIF_ObjectData>\n  </SIF_Event>\n</SIF_Message>"

  end

  it "creates GradingAssignmentScore event object" do

    event = builder.event('GradingAssignmentScore','Add',@grade_assignment_score_object_model)
    event_rep = SIF::Representation::Infra::Common::Message.new(event).to_xml
    event_rep.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Event>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_ObjectData>\n      <SIF_EventObject ObjectName=\"GradingAssignmentScore\" Action=\"Add\">\n        <GradingAssignmentScore StudentPersonalRefId=\"A75A00101A8C301D02E3A05B359D0A00\" SectionInfoRefId=\"D0A0A27AD0A8510AD9D75101A8C3DA39\" GradingAssignmentRefId=\"359D75101AD0A9D7A8C3DAD0A85105D2\" SchoolInfoRefId=\"11737EA4301CADCA75C87214A7C46BDB\">\n          <ScorePoints>45</ScorePoints>\n          <ScorePercent>90</ScorePercent>\n          <ScoreDescription>Excellent</ScoreDescription>\n          <SIF_ExtendedElements/>\n        </GradingAssignmentScore>\n      </SIF_EventObject>\n    </SIF_ObjectData>\n  </SIF_Event>\n</SIF_Message>"

  end

end