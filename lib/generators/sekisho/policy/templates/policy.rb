module <%= class_name %>
  class <%=class_name.demodulize %><%= Sekisho.config.suffix %> < Application<%= Sekisho.config.suffix %>
    def authorized?
    end
  end
end

