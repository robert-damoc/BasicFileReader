# frozen_string_literal: false

# Entry Point class
class BasicFileReader
  class << self
    def lines(file_name:, &block)
      file = File.open(file_name)
      [].tap do |content_lines|
        file.each do |line|
          content_lines << (yield line.gsub("\n", '')) if block
          content_lines << line.gsub("\n", '') unless block
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
