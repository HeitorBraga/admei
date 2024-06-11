class MiscController < ApplicationController
  def settings
    set_title('Configurações')
  end

  def save_setting
    Setting.set(params[:name], params[:value])

    render json: :ok
  end
end
