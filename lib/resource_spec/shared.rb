RSpec.shared_examples "responds 200" do
  it "responds 200" do
    expect(response).to be_success
  end
end

RSpec.shared_examples "responds 301" do
  it "responds 301" do
    expect(response).to redirect_to(redirect_url)
  end
end

RSpec.shared_examples "resource has no errors" do
  it "resource has no errors" do
    expect(resource.errors).to be_blank, "Given params: #{url_args} failed with errors: #{resource.errors.full_messages}"
  end
end

RSpec.shared_examples "resource has errors" do
  it "resource has errors" do
    expect(resource.errors).to be_present
  end
end

RSpec.shared_examples "resource persisted" do
  it "resource persisted" do
    expect(resource).to be_persisted
  end
end

RSpec.shared_examples "resource has expected attributes" do
  it "resource has expected attributes" do
    expect(resource.reload).to have_attributes(params_to_expect)
  end
end
