RSpec.shared_context "ResourceSpec" do |model|
  let(:model) { model }
  let(:param_name) { model.model_name.param_key }
  let(:attributes) do
    unless defined?(FactoryGirl)
      fail "FactoryGirl is not loaded, roll your own let(:attributes)"
    end
    FactoryGirl.attributes_for(model)
  end
  let(:params) { attributes }
  let(:record) { assigns[param_name] }
end
