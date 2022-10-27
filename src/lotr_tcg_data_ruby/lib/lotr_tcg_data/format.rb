module LotrTcgData
  class Format
    extend Concerns::WithLocalData.new(path: "formats.yml")
    include Strict::Value

    attributes do
      key String
      display_name String
      set_numbers ArrayOf(Integer), default: []
    end
  end
end