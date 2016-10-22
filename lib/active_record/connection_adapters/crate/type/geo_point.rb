module ActiveRecord
  module ConnectionAdapters
    module Crate
      module Type
        class GeoPoint < ActiveRecord::Type::Value

          def serialize(value)
            value
          end

          def type_cast_for_schema(value)
            serialize(value)
          end

        end
      end
    end
  end
end