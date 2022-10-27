module LotrTcgData
  module Concerns
    class WithLocalData < Module
      def initialize(path:)
        define_method :fetch do |key, *args, &block|
          lookup.fetch(key, *args) do
            raise "failed to find #{key} in #{path}"
          end
        end

        define_method :lookup do
          @lookup ||= LotrTcgData.load_local(path).map do |data|
            new(**data.transform_keys(&:to_sym))
          end.index_by(&:key).freeze
        end
      end
    end
  end
end