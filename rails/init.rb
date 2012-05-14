require File.join(File.dirname(__FILE__), *%w[.. lib penmanship])

::Penmanship.constants.each do |module_name|
  module_class = Penmanship.const_get(module_name)
  if module_class.respond_to? :on_enable
    module_class.on_enable
  end
end