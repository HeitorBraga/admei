class ApplicationController < ActionController::Base
  include Controllers::Searchable
  include Controllers::Authenticate
  include SetCurrentRequestDetails

  before_action do
    ActiveStorage::Current.host = request.base_url
  end

  private

  def set_title(title)
    @title = title
  end

  def render_many_components(components)
    components.map { |c| c.render_in(self.view_context) }.join('')
  end
end
