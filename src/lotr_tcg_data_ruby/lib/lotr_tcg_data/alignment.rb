module LotrTcgData
  class Alignment
    include ValueSemantics.for_attributes {
      key String
      alignment Alignment
      name String
      sets ArrayOf(Integer), default: []
    }
  end
end