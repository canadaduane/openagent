module OpenAgent
  module AssignVariables
    def assign_variables(keys, opts)
      # Protected assignment
      keys.each do |key|
        if opts.has_key? key
          value = opts[key]
        elsif opts.has_key? key.to_sym
          value = opts[key.to_sym]
        else
          # Don't try to assign a variable that
          # has no corresponding key in 'opts' hash
          next
        end
        instance_variable_set("@#{key}", value)
      end
    end
  end
end