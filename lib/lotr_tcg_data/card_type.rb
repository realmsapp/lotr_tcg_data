module LotrTcgData
  class CardType
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end