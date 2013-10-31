require_relative 'spec_helper'
require 'sif/models/system_control'

describe SIF::Model::SystemControl do
  let(:sc) { SIF::Model::SystemControl.new }

  it "has nil header" do
    sc.header.should be_nil
  end
end