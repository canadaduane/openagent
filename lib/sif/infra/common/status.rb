require_relative 'data'

module SIF
  module Infra
    module Common
      class Status
        include Virtus.model

        attribute :data, Data

        attribute :code, Integer
        attribute :desc, String
      end
    end
  end
end