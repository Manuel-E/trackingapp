module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      us=FactoryGirl.create(:user)
      us.add_role "admin"
      sign_in us # Using factory girl as an example

    end
  end

end