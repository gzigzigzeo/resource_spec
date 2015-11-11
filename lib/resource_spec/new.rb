RSpec.shared_examples "GET :new" do
  describe "GET :new" do
    it "200" do
      get :new, new_url_args

      expect(response).to be_success

      expect(resource).to be_present
      expect(resource).to be_new_record
    end
  end
end
