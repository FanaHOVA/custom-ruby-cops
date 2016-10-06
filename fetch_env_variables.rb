module RuboCop
  module Cop
    module Style
      # This cop enforces using fetch on ENV variables
      #
      # @example
      #
      #   # bad
      #   ENV['REDISTOGO_URL']
      #
      #   # good
      #   ENV.fetch('REDISTOGO_URL')

      class FetchEnvVariables < Cop
        MSG = 'Use ENV.fetch when loading ENV variables.'.freeze
        def investigate(processed_source)
          processed_source.lines.each_with_index do |line, index|
            next if line.starts_with('#')
            next unless line =~ /ENV\[/

            range = source_range(processed_source.buffer,
                                 index + 1,
                                 (line.rstrip.length)...(line.length))

            add_offense(:message, range)
          end
        end
      end
    end
  end
end
