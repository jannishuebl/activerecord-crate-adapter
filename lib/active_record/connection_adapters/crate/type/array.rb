module ActiveRecord
  module ConnectionAdapters
    module Crate
      module Type
        class Array < ActiveRecord::Type::Value

          def serialize(value)
            return value
          end

          def type_cast_for_schema(value)
            return value
          end

        end
      end
    end
  end
end