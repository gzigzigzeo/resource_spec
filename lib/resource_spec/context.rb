RSpec.shared_context "ResourceSpec" do |model|
  let(:model) { model }

  let(:param_name) { model.model_name.param_key }
  let(:primary_key_param_name) { :id }

  let(:attributes) { FactoryGirl.attributes_for(model) }
  let(:params) { attributes }
  let(:invalid_params) { Hash[params.keys.zip([""] * params.keys.size)] }

  let(:resource) { assigns[param_name] }
  let(:instance) { FactoryGirl.create(model) }

  let(:url_args) { {} }

  let(:new_url_args) { url_args.merge(param_name => params) }

  let(:success_resource_url) do
    controller.url_for(action: :show, primary_key_param_name => resource.id)
  end

  let(:create_url_args) { new_url_args }
  let(:invalid_create_url_args) { url_args.merge(param_name => invalid_params) }
  let(:success_create_url) { success_resource_url }

  let(:edit_url_args) { url_args.merge(primary_key_param_name => instance.id) }

  let(:update_url_args) { edit_url_args.merge(new_url_args) }
  let(:invalid_update_url_args) do
    edit_url_args.merge(param_name => invalid_params)
  end
  let(:success_update_url) { success_resource_url }

  let(:destroy_url_args) { edit_url_args }
  let(:success_destroy_url) { controller.url_for(action: :index) }
end
