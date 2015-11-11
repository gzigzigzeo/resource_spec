require "spec_helper"

describe UsersController, type: :controller do
  include_context "ResourceSpec", User do
    it_behaves_like "GET :new"
    it_behaves_like "POST :create"
    it_behaves_like "GET :edit"
    it_behaves_like "PUT :update"
    it_behaves_like "DELETE :destroy"
  end
end
