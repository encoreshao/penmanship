require "spec_helper"

describe Lavender::LoggerSupport do
  class TestLog
    include Lavender::LoggerSupport
  end

  it "should be return rails logger" do
    Rails.logger = "Test"
    TestLog.logger.should be_eql "Test"
  end
  
  
  it "should be return STDOUT logger" do
    Rails.logger = nil
    TestLog.logger.should_not be_nil
  end
end