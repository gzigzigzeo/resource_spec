RSpec.shared_examples "DELETE :destroy" do
  describe "DELETE :destroy" do
    it "301" do
      delete :destroy, destroy_url_args

      expect(response).to redirect_to(success_destroy_url)
      expect { resource.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
