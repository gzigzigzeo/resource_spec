RSpec.shared_examples "POST :create" do
  describe "POST :create" do
    context "success" do
      let(:url_args) { create_url_args }
      let(:redirect_url) { success_create_url }

      before { post :create, url_args }

      include_examples "responds 301"
      include_examples "resource has no errors"
      include_examples "resource persisted"
      include_examples "resource has expected attributes"
    end

    context "fail" do
      let(:url_args) { invalid_create_url_args }

      before { post :create, url_args }

      include_examples "responds 200"
      include_examples "resource has errors"
    end
  end
end
