require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new contact" do
        post :create, {username: 'Deepak', dialect: 'Yoda'}
        session[:username].should eq("Deepak") 
      end
    
      it "redirects to the messages page" do
        post :create, {username: 'Deepak', dialect: 'Yoda'}
        response.should redirect_to messages_path
      end
    end
  
    context "with invalid attributes" do
      it "does not save the new contact" do
        post :create, {username: 'Deepak'}
        assigns(controller.session[:username]).should eq(nil) 
      end
    
      it "redirects to root url" do
        post :create, {username: 'Deepak'}
        response.should redirect_to root_path
      end
    end 
  end

  describe "DELETE destroy" do
    before :each do
      session[:username] = "Deepak"
    end
  
    it "deletes the session username" do
      delete :destroy
      session[:username].should eq(nil) 
    end
  end

end
