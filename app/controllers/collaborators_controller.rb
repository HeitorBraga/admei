class CollaboratorsController < ApplicationController
  include Controllers::Crudify
  model_klass Collaborator

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:collaborator).permit(:name)
  end
end
