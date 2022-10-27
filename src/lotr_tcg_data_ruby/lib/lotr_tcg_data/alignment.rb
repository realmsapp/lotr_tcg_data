module LotrTcgData
  class Alignment
    extend Concerns::WithLocalData.new(path: "alignments.yml")
    include Strict::Value

    attributes do
      key String
      name String
    end
  end
end