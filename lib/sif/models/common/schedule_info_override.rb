module SIF
  module Model
    module Common
      class ScheduleInfoOverride
        include Virtus.model

        attribute :term_info_ref_id
        attribute :override
        attribute :meeting_times, Array[String]
      end
    end
  end
end