module <%= class_name %>
  module Actions
    class <%= action_name.classify %><%= Sekisho.config.suffix %> < <%= class_name.demodulize %><%= Sekisho.config.suffix %>
      def authorized?
      end
    end
  end
end
