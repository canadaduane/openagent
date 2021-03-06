module SIF
  module Representation
    module Model
      module Group
        module SIS
          class TermInfo < SIF::Represent
            include SISRepresenter

            self.representation_wrap = 'TermInfo'

            property :school_info_ref_id, :attribute => true, :as => 'SchoolInfoRefId'
            property :school_year, :attribute => true, :as => 'SchoolYear'
            property :start_date, :as => 'StartDate'
            property :end_date, :as => 'EndDate'
            property :description, :as => 'Description'
            property :relative_duration, :as => 'RelativeDuration'
            property :term_code, :as => 'TermCode'
            property :track, :as => 'Track'
            property :term_span, :as => 'TermSpan',
                     :class => SIF::Model::Group::DataModel::TermSpan,
                     :decorator => SIF::Representation::Model::Group::DataModel::TermSpan
            property :marking_term, :as => 'MarkingTerm'
            property :scheduling_term, :as => 'SchedulingTerm'
            property :attendance_term, :as => 'AttendanceTerm'
          end
        end
      end
    end
  end
end
