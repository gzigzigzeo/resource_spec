RSpec.shared_examples "DELETE :destroy" do |options = {}|
  describe "DELETE :destroy" do
    context "success" do
      let(:url_args) { destroy_url_args }
      let(:redirect_url) { success_destroy_url }

      before do
        if options[:xhr]
          xhr :delete, :destroy, url_args
        else
          delete :destroy, url_args
        end
      end

      include_examples "responds with success", options

      it "resource destroyed" do
        if options[:paranoid]
          expect(resource.deleted_at).to be_present
        else
          expect { resource.reload }.to raise_error(
            ActiveRecord::RecordNotFound
          )
        end
      end
    end
  end
end
