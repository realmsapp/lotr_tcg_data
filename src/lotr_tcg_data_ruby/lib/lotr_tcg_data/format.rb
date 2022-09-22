module LotrTcgData
  class Format
    key String
    display_name String
    set_numbers ArrayOf(Integer), default: []
  end
end