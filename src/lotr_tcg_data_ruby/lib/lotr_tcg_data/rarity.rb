module LotrTcgData
  class Rarity
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end