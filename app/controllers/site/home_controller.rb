class Site::HomeController < ApplicationController
  skip_before_action :authenticate_user!
  layout "site/layouts/site"

  def index
  end
end
