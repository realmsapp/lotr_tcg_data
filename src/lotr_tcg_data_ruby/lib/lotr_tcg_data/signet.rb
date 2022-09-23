module LotrTcgData
  class Signet
    extend Concerns::WithLocalData.new(path: "signets.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end