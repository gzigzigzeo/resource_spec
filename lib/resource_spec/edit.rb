RSpec.shared_examples "GET :edit" do
  describe "GET :edit" do
    let(:url_args) { edit_url_args }

    before { get :edit, url_args }

    include_examples "responds 200"

    it "resource loaded" do
      expect(resource).to eq(instance)
    end
  end
end
