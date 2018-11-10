module <%= class_name %>
  class <%=class_name.demodulize %><%= Sekisho.config.suffix %> < Application<%= Sekisho.config.suffix %>
    def <%= Sekisho.config.query_method %>
    end
  end
end
