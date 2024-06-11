module Controllers::Searchable
  extend ActiveSupport::Concern

  included do
    helper_method :show_search?
  end

  def show_search?
    self.class.get_show_search && self.class.get_show_search.include?(action_name.to_sym)
  end

  class_methods do
    def get_show_search
      @show_search
    end

    def show_search(*only)
      @show_search = only
    end

    def show_search_on_index!
      show_search :index
    end

    def hide_search!
      show_search false
    end
  end
end
