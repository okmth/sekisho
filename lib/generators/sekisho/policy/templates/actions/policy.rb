module <%= class_name %>
  module Actions
    class <%= action_name.classify %><%= Sekisho.config.suffix %> < <%= class_name.demodulize %><%= Sekisho.config.suffix %>
      def <%= Sekisho.config.query_method %>
      end
    end
  end
end
