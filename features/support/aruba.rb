require 'aruba/cucumber'
require 'aruba/api'

Before do
  @dirs = ["/Users/zonodon/Applications/Ruby/Rails/glittery"]
end

After("@stop-process-after") do
end
