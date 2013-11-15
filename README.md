OpenAgent
=========

OpenAgent is a Ruby library for educational institutions that makes it easy to communicate with a ZIS (Zone Information Server). It implements most of the SIF 2.0r1 (School Interoperability Framework) specification.

Getting Started
--------------------

```ruby
client = OpenAgent::Client.connect(:name => "myagent", :url => "http://zis.institution.com/zis/myzone")

# Send an initial request for all StudentPersonal objects
client.request('StudentPersonal')

# Set a callback so we can do something when we receive replies
client.callback(:receive_message) do |message, http_response|
  File.open("#{message.timestamp}.xml", "w") do |file|
    file.write(http_response.body)
  end
end

# Enter a polling loop
client.run
```

Blog
----
http://blog.openzis.org/2010/08/23/creating-the-start-of-a-sif-agent-in-ruby/


SIF 2.0 Spec
------------
http://specification.sifinfo.org/Implementation/2.0r1/

History
-------
OpenAgent started as a Billboard.Net implementation of SIF in Ruby. Some features were later added by Instructure.

TODO
----

- Convert old conditiongroup code to a DSL or something:
```ruby
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
```