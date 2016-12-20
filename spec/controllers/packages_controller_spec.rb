require 'rails_helper'

RSpec.describe PackagesController, type: :controller do

  describe "#get_package_by_tracking_id" do
      it "can search " do
        package = FactoryGirl.create(:package)
        get :get_package_by_tracking_id, tracking_id:package.tracking_id
        expect(assigns(:package).tracking_id).to eq(package.tracking_id)
      end

      it "Not visible for package with status 'Entregado'" do
        packages1 = FactoryGirl.create(:package,state:FactoryGirl.create(:state,name:"Entregado"))
        get :get_package_by_tracking_id,tracking_id:packages1.tracking_id
        expect(assigns(:package)).to be_nil
      end

  end

  describe "#index" do
   	login_admin
      it "Load @packages" do
        packages1 = FactoryGirl.create(:package)
        packages2 = FactoryGirl.create(:package)
        packages3 = FactoryGirl.create(:package)
        packages4 = FactoryGirl.create(:package)
        packages5 = FactoryGirl.create(:package)
        get :index
        expect(assigns(:packages).count).to eq(5)
      end
  end

  describe "#create" do
    login_admin

    it "Create package" do
      package_params=FactoryGirl.attributes_for(:package_for_attributes)
      post :create,package:package_params
      expect(assigns(:package).id).to be_truthy 
    end

     it "Invalid package without locations" do
      package_params=FactoryGirl.attributes_for(:package)
      post :create,package:package_params
      expect(assigns(:package).id).to be_nil 
    end
  end

  describe "#update" do
    login_admin

    it "Update package" do
      packages1 = FactoryGirl.create(:package)
      package_params=FactoryGirl.attributes_for(:package_for_attributes)
      put :update,id:packages1.id,package:{content:'new content'}
      expect(assigns(:package).content).to eq("new content") 
    end

  end

  describe "#cancel_package" do

      it "Allow to cancel package" do
        packages1 = FactoryGirl.create(:package,state:FactoryGirl.create(:state,name:"En Bodega"))
        FactoryGirl.create(:state,name:"Cancelado")
        post :cancel_package,tracking_id:packages1.tracking_id
        expect(assigns(:package).state.name).to eq('Cancelado') 
      end
      it "Not allow to Cancel package with state 'En Bodega'" do
        packages1 = FactoryGirl.create(:package)
        post :cancel_package,tracking_id:packages1.tracking_id
        expect(assigns(:package)).to be_nil 
      end

      it "Not allow to  cancel package with state 'Entregado'" do
        packages1 = FactoryGirl.create(:package,state:FactoryGirl.create(:state,name:"Entregado"))
        post :cancel_package,tracking_id:packages1.tracking_id
        expect(assigns(:package)).to be_nil
      end
    end


end
