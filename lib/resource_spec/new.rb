RSpec.shared_examples "GET :new" do
  describe "GET :new" do
    it "200" do
      get :new, new_url_args

      expect(response).to be_success

      expect(resource).to be_present, "let(:resource) must point to controller variable containing instance, assigns[#{param_name}] by default"
      expect(resource).to be_new_record
    end
  end
end
