RSpec.shared_examples "PUT :update" do
  describe "PUT :update" do
    context "success" do
      let(:url_args) { update_url_args }
      let(:redirect_url) { success_update_url }

      before { put :update, url_args }

      include_examples "responds 301"
      include_examples "resource has no errors"
      include_examples "resource has expected attributes"
    end

    context "fail" do
      let(:url_args) { invalid_update_url_args }

      before { post :update, url_args }

      include_examples "responds 200"
      include_examples "resource has errors"
    end
  end
end
