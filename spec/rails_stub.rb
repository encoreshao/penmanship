module Rails
  class << self
    attr_accessor :env, :logger
    
    def root
      @root ||= Pathname.new(File.dirname(__FILE__)).join("..")
    end
  end
end