require "spec_helper"

describe Penmanship::Daemon do
  class TestDaemon
    include Penmanship::Daemon
    
    attr_writer :callback
    
    def callback(&block)
      if block
        @callback = block
      else
        @callback
      end
    end
    
    def execute
      callback.call if callback
      sleep 0.05
    end
  end
  
  before(:each) do
    ENV["PID_FILE"] = nil
    @pid_path = Rails.root.join("tmp", "pids", "test.pid").to_s
  end
  
  it "should be create pid file by path" do
    build_and_start_test_daemon do |d|
      d.callback { File.exists?(@pid_path).should be_true }
      d.pid_file_path = @pid_path 
    end
    File.exists?(@pid_path).should be_false
  end
  
  it "should be create pid file by ENV" do
    ENV["PID_FILE"] = @pid_path
    build_and_start_test_daemon do |d|
      d.callback { File.exists?(@pid_path).should be_true }
    end
    File.exists?(@pid_path).should be_false
  end
  
  it "should be create pid file by default" do
    build_and_start_test_daemon do |d|
      d.pid_file_path.should_not be_nil
      d.callback { File.exists?(d.pid_file_path).should be_true }
    end
  end
  
  it "should be not create pid file" do
    build_and_start_test_daemon do |d|
      pid_path = d.pid_file_path
      d.pid_file_path = nil
      d.callback { File.exists?(pid_path).should be_false }
    end
  end
  
  it "should be catch exception" do
    daemon = build_and_start_test_daemon do |d|
      d.callback { raise "exception" }
    end
    
    File.exists?(daemon.pid_file_path).should be_false
  end
  
  it "should be exit if pid file exists" do
    build_and_start_test_daemon do |d|
      d.pid_file_path = @pid_path
      d.write_pid_file(Process.pid)
      d.callback { fail("MUST exit at start") }
    end
  end
  
  def build_and_start_test_daemon
    Thread.new do 
      sleep 0.5
      Process.kill("INT", $$)
    end
    
    daemon = TestDaemon.new
    daemon.logger.level = Logger::FATAL
    yield(daemon) if block_given?
    
    daemon.start
    daemon
  end
end