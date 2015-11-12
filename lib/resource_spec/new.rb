RSpec.shared_examples "GET :new" do
  describe "GET :new" do
    let(:url_args) { new_url_args }

    before { get :new, url_args }

    include_examples "responds 200"

    it "resource exists" do
      expect(resource).to be_present
    end

    it "resource is new record" do
      expect(resource).to be_new_record
    end
  end
end
