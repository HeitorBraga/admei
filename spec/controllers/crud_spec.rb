require 'rails_helper'

describe 'Controllers::Crudify', type: :controller do
  controller do
    include Controllers::Crudify
    prepend_view_path 'views/ncms'

    def model_klass
      Ncm
    end

    def resource_params
      params.require(:ncm).permit(:code, :description)
    end
  end

  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET index" do
    let(:ncms) { create_list(:ncm, 10)}

    xit "assigns @ncms" do
      get :index
      expect(assigns(:ncms)).to eq(ncms)
    end

    xit "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end