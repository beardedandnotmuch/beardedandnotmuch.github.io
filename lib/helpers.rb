include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Tagging

module Nanoc::Helpers
  module LinkTo
    def menu_item(text, target, attributes = {})
      # Find path
      path = target.is_a?(String) ? target : target.path

      if @item_rep && @item_rep.path == path
        # Create message
        "<li class=\"active\">#{link_to(text, target, attributes)}</li>"
      else
        "<li>#{link_to(text, target, attributes)}</li>"
      end
    end
  end
end
