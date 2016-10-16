require 'active_record/type'
require 'active_record/connection_adapters/crate/type/array.rb'

module ActiveRecord
  module Type
    Crate = ConnectionAdapters::Crate::Type
  end
end