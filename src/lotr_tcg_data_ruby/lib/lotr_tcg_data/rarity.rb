module LotrTcgData
  class Rarity
    extend Concerns::WithLocalData.new(path: "rarities.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end