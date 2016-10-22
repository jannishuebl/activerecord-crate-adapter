require 'active_record/type'
require 'active_record/connection_adapters/crate/type/array.rb'
require 'active_record/connection_adapters/crate/type/date_time.rb'

module ActiveRecord
  module Type
    Crate = ConnectionAdapters::Crate::Type
  end
end