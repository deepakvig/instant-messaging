require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET new" do
    it "renders the :new view" do
      get :new
      response.should render_template :new
    end
  end

end
