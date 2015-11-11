RSpec.shared_examples "GET :edit" do
  describe "GET :edit" do
    it "200" do
      get :edit, edit_url_args

      expect(response).to be_success
      expect(resource).to eq(instance)
    end

    it "ActiveRecord::RecordNotFound" do
      expect { get :edit, invalid_edit_url_args }.to raise_error(
        ActiveRecord::RecordNotFound
      )
    end
  end
end
