module LotrTcgData
  module Concerns
    class WithRealmsYaml < Module
      def initialize(omit: [], as_text: [])
        define_method(:to_realms_yaml) do
          attributes = instance_variables.each_with_object({}) do |ivar, memo|
            name = ivar.name.slice(1..)
            value = instance_variable_get(ivar)
            if value.respond_to?(:key)
              memo[name.to_sym] = value.key unless value.key == "none"
            else
              memo[name.to_sym] = value  unless value.blank?
            end
          end
          attributes.slice(*as_text).each do |k,v|
            attributes[k] = LiteralScalar.new(v.delete("\r")) if v.present?
          end
          YAML.dump(attributes.except(*omit).stringify_keys)
        end
      end
    end

    private

    class LiteralScalar
      attr_reader :str

      def initialize(str)
        @str = str
      end

      def blank?
        str.blank?
      end

      def encode_with(coder)
        coder.style = Psych::Nodes::Scalar::LITERAL
        coder.scalar = str
        coder.tag = nil
      end
    end
  end
end