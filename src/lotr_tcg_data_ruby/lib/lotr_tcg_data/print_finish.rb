module LotrTcgData
  class PrintFinish
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end