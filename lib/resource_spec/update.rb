RSpec.shared_examples "PUT :update" do
  describe "PUT :update" do
    it "301" do
      put :update, update_url_args

      expect(response).to redirect_to(success_update_url)

      expect(resource.reload).to have_attributes(params)
      expect(resource.errors).to be_blank
    end

    it "422" do
      put :update, invalid_update_url_args

      expect(response).to be_success
      expect(resource.errors).to be_present
    end
  end
end
