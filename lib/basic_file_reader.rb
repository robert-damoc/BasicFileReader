class BasicFileReader
  class << self
    def lines(file_name:, &block)
      file = open(file_name)
      [].tap do |content_lines|
        file.each do |line|
          if block
            content_lines << (yield line.gsub("\n", ''))
          else
            content_lines << line.gsub("\n", '')
          end
        end
        file.close
      end
    end

    def content(file_name:, &block)
      content = File.read(file_name).gsub("\n", '')
      if block
        yield content
      else
        content
      end
    end
  end
end
