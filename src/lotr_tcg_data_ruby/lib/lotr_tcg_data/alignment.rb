module LotrTcgData
  class Alignment
    extend Concerns::WithLocalData.new(path: "alignments.yml")
    include ValueSemantics.for_attributes {
      key String
      name String
    }
  end
end