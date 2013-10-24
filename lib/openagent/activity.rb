require "openagent/sif"

module OpenAgent
    
    class Activity
      
      def initialize(agent_obj = nil, zone_obj = nil, sif_obj = OpenAgent::SIF.new )
        raise ArgumentError, "Agent Object is required" unless agent_obj
        raise ArgumentError, "Zone Object is required" unless zone_obj
        @agent    = agent_obj
        @zone     = zone_obj
        @sif      = sif_obj
      end

      def create_conditiongroup(refobject, refid, operator="EQ")
        cond1 = OpenAgent::Message::SIF_Request::SIF_Condition.new
        cond1.element = "@SIF_RefObject"
        cond1.operator = "EQ"
        cond1.value = refobject

        cond2 = OpenAgent::Message::SIF_Request::SIF_Condition.new
        cond2.element = "@SIF_RefId"
        cond2.operator = operator
        cond2.value = refid

        conditions = OpenAgent::Message::SIF_Request::SIF_Conditions.new
        conditions.condition = [cond1, cond2]
        conditions.type = 'And'

        OpenAgent::Message::SIF_Request::SIF_ConditionGroup.new.tap do |cg|
          cg.conditions = [conditions]
          cg.type = 'None'
        end
      end
      
      def create(action, options={})
        sif_msgid = nil
        action = action.downcase

        if @sif.respond_to?(action)
          case action.to_s
          when 'cancelrequest'
            o, msgid = @sif.send "#{action}", @agent, @zone, options[:notification_type], options[:requestmsgids]
          when 'request'
            conditiongroup = options[:condition] ? create_conditiongroup(*options[:condition]) : options[:conditiongroup]
            o, msgid = @sif.send "#{action}", @agent, @zone, options[:objectname], conditiongroup
          when 'event'
            o, msgid = @sif.send "#{action}", @agent, @zone, options[:objectname], options[:xml], options[:action]
          when 'ack'
            o, msgid = @sif.send "#{action}", @agent, @zone, options[:originalsourceid], options[:originalmsgid], options[:code] 
          else
            o, msgid = @sif.send "#{action}", @agent ,@zone
          end
        else
          o, msgid = nil, nil
        end
        return o, msgid
      end
      
      def create_xml(action, options={})
        msgid = nil
        xml, msgid = create(action, options)
        if xml.respond_to?(:to_xml)
          [xml.to_xml.to_s, msgid]
        else
          [xml, msgid]
        end
      end
      
    end
     
end