RSpec.shared_examples "GET :index" do
  let!(:expected_collection) { FactoryGirl.create_list(model, rand(3) + 1) }

  describe "GET :index" do
    it "200" do
      get :index, index_url_args

      expect(response).to be_success
      expect(collection.size).to eq(expected_collection.size)
      expect(collection).to include(*expected_collection)
    end
  end
end
