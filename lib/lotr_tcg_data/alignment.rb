module LotrTcgData
  class Alignment
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end