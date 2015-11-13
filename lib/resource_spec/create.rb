RSpec.shared_examples "POST :create" do |options = {}|
  describe "POST :create" do
    include_examples "POST :create, success", options
    include_examples "POST :create, fail", options
  end
end

RSpec.shared_examples "send POST :create" do |options = {}|
  before do
    if options[:xhr]
      xhr :post, :create, url_args
    else
      post :create, url_args
    end
  end
end

RSpec.shared_examples "POST :create, success" do |options = {}|
  context "success" do
    let(:url_args) { create_url_args }
    let(:redirect_url) { success_create_url }

    include_examples "send POST :create", options
    include_examples "responds with success", options
    include_examples "resource has no errors"
    include_examples "resource persisted"
    include_examples "resource has expected attributes"
  end
end

RSpec.shared_examples "POST :create, fail" do |options = {}|
  context "fail" do
    let(:url_args) { invalid_create_url_args }

    include_examples "send POST :create", options
    include_examples "responds with failure", options
    include_examples "resource has errors"
  end
end
