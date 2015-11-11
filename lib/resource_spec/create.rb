RSpec.shared_examples "POST :create" do
  describe "POST :create" do
    it "301" do
      post :create, create_url_args

      expect(resource.errors).to be_blank, "Given params: #{create_url_args} failed with errors: #{resource.errors.full_messages}, "
      expect(resource).to be_persisted
      expect(resource.reload).to have_attributes(params_to_expect)

      expect(response).to redirect_to(success_create_url)
    end

    it "422" do
      post :create, invalid_create_url_args

      expect(response).to be_success
      expect(resource.errors).to be_present
    end
  end
end
