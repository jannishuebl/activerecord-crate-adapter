module ActiveRecord
  module ConnectionAdapters
    module Crate
      module Type
        class DateTime < ActiveRecord::Type::Value

          def deserialize(value)
            return nil unless value
            Time.at(value)
          end


          def serialize(value)
            return value if value.is_a? Integer
            value = value.to_time if value.respond_to? :to_time
            value.to_i
          end

          def type_cast_from_schema(value)
            serialize(value)
          end

          def type_cast_for_schema(value)
            serialize(value)
          end

        end
      end
    end
  end
end