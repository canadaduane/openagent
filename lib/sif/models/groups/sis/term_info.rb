require 'date'
require_relative 'sis_representer'
require '../data_model/term_span'

module SIF
  module Model
    module Group
      module SIS
        class TermInfo

          include Virtus.model
          include SISRepresenter

          attribute :school_info_ref_id, String
          attribute :school_year, String
          attribute :start_date, Date
          attribute :end_date, Date
          attribute :description, String
          attribute :relative_duration, Float
          attribute :term_code, String
          attribute :track, String
          attribute :term_span, SIF::Model::Group::DataModel::TermSpan
          attribute :marking_term, String
          attribute :scheduling_term, String
          attribute :attendance_term, String
        end
      end
    end
  end
end