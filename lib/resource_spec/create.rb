RSpec.shared_examples "POST :create" do
  describe "POST :create" do
    it "301" do
      post :create, create_url_args

      expect(response).to redirect_to(success_create_url)
      expect(resource).to be_persisted
      expect(resource.errors).to be_blank
    end

    it "422" do
      post :create, invalid_create_url_args

      expect(response).to be_success
      expect(resource.errors).to be_present
    end
  end
end
