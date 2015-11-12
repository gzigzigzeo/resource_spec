RSpec.shared_examples "DELETE :destroy" do |**kwargs|
  describe "DELETE :destroy" do
    context "success" do
      let(:url_args) { destroy_url_args }
      let(:redirect_url) { success_destroy_url }

      before { delete :destroy, url_args }

      include_examples "responds 301"

      it "resource destroyed" do
        if kwargs[:paranoid]
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
