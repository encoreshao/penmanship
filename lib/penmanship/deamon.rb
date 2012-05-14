require "fileutils"

module Penmanship
  module Daemon

    def self.included(base)
      base.instance_eval do
        include LoggerSupport
        
        include InstanceMethods
        extend ClassMethods
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      attr_accessor :pid_file_path

      def initialize
        self.pid_file_path = Rails.root.join("tmp", "pids", "#{daemon_name}.pid")
      end

      def daemon_name
        self.class.name
      end

      def register_trap
        %w{TERM INT HUP}.each do |signal_name| 
          Signal.trap(signal_name) do
            self.stop
          end
        end
      end

      def pid_file_path
        ENV["PID_FILE"] || @pid_file_path
      end
      
      def write_pid_file(pid)
        if self.pid_file_path
          File.open(self.pid_file_path, "w") { |f| f << pid }
        end
      end

      def remove_pid_file
        FileUtils.rm(pid_file_path, :force => true) if self.pid_file_path && File.exists?(self.pid_file_path)
      end
      
      def already_running?
        if self.pid_file_path && File.exists?(self.pid_file_path)
          pid = File.read(self.pid_file_path)
          return Process.kill(0, pid.to_i) == 1 if pid # test running
        end
        return false
      rescue Errno::ESRCH #  NOT running or zombied
        return false
      end

      def start
        return if already_running?
        
        register_trap
        write_pid_file(Process.pid)
        logger.info { "Daemon: #{daemon_name} starting ... PID: #{Process.pid}" }
        
        @run = true

        while @run
          self.execute
        end
        logger.info { "Daemon: #{daemon_name} stoped ..." }
      rescue Exception => e
        logger.error(e)
      ensure
        remove_pid_file
      end

      def stop
        @run = false
      end
    end
  end
end