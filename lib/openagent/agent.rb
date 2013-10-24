require "openagent/utils/assign_variables"

module OpenAgent
  class Agent
    include AssignVariables
    attr_accessor :sourceid
    attr_accessor :name
    attr_accessor :version
    attr_accessor :maxbuffersize
    attr_accessor :mode
    attr_accessor :msg_version
    attr_accessor :msg_xmlns

    attr_accessor :provideobjects
    attr_accessor :subscribeobjects
    attr_accessor :publishaddobjects
    attr_accessor :publishchangeobjects
    attr_accessor :publishdeleteobjects
    attr_accessor :requestobjects
    attr_accessor :respondobjects

    def initialize(opts)
      assign_variables(%w(sourceid msg_version msg_xmlns
        name version mode maxbuffersize
        provideobjects subscribeobjects
        publishaddobjects publishchangeobjects
        publishdeleteobjects requestobjects
        respondobjects), opts)
    end

    def self.from_yaml(filename)
      Agent.new(YAML::load(File.open("#{filename}")))
    end
  end
end