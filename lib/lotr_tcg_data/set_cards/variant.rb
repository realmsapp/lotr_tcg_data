module LotrTcgData
  module SetCards
    class Variant
      include ValueSemantics.for_attributes {
        key String
        name String
      }
    end
  end
end