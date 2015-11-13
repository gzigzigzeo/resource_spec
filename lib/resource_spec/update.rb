RSpec.shared_examples "PUT :update" do |options = {}|
  describe "PUT :update" do
    include_examples "PUT :update, success", options
    include_examples "PUT :update, fail", options
  end
end

RSpec.shared_examples "send PUT :update" do |options = {}|
  before do
    if options[:xhr]
      xhr :put, :update, url_args
    else
      put :update, url_args
    end
  end
end

RSpec.shared_examples "PUT :update, success" do |options = {}|
  context "success" do
    let(:url_args) { update_url_args }
    let(:redirect_url) { success_update_url }

    include_examples "send PUT :update", options
    include_examples "responds with success", options
    include_examples "resource has no errors"
    include_examples "resource has expected attributes"
  end
end

RSpec.shared_examples "PUT :update, fail" do |options = {}|
  context "fail" do
    let(:url_args) { invalid_update_url_args }

    include_examples "send PUT :update", options
    include_examples "responds with failure", options
    include_examples "resource has errors"
  end
end
