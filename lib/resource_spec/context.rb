RSpec.shared_context "ResourceSpec" do |model|
  let(:model) { model }

  let(:param_name) { model.model_name.param_key }
  let(:primary_key_param_name) { :id } # /resource/:id/edit
  let(:factory_name) { model } # FactoryGirl(Namespaced::Model) fails

  let(:attributes) { FactoryGirl.attributes_for(factory_name).except(:id) }
  let(:params) { attributes }

  # Used to skip values changing on record save.
  #
  # POST /users/create?user[name]=John&user[password]=5
  # expect(user).to have_attributes({name: "John"})
  #
  # No need to check password: it's encrypted
  let(:not_expected_params) { [] } # Usually :password, :image, etc.
  let(:params_to_expect) { params.except(*not_expected_params) }

  # Valid params with blank values by default
  let(:invalid_params) { Hash[params.keys.zip([""] * params.keys.size)] }

  # Returns active object instance from controller. Could be `controller.resource` if you use decent_exposure.
  let(:resource) { assigns[param_name] }
  let(:instance) { FactoryGirl.create(factory_name) }

  # Returns collection, same as :resource
  let(:collection) { assigns[param_name.to_s.pluralize.to_sym] }

  let(:default_url_args) { {} }

  let(:index_url_args) { {} }

  let(:new_url_args) { default_url_args.merge(param_name => params) }

  let(:success_resource_url) do
    controller.url_for(action: :show, primary_key_param_name => resource.id)
  end

  let(:create_url_args) { new_url_args }
  let(:invalid_create_url_args) { default_url_args.merge(param_name => invalid_params) }
  let(:success_create_url) { success_resource_url }

  let(:edit_url_args) { default_url_args.merge(primary_key_param_name => instance.id) }

  let(:update_url_args) { edit_url_args.merge(new_url_args) }
  let(:invalid_update_url_args) do
    edit_url_args.merge(param_name => invalid_params)
  end
  let(:success_update_url) { success_resource_url }

  let(:destroy_url_args) { edit_url_args }
  let(:success_destroy_url) { controller.url_for(action: :index) }
end
