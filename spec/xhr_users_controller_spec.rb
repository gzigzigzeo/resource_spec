require "spec_helper"

describe XhrUsersController, type: :controller do
  include_context "ResourceSpec", User do
    it_behaves_like "POST :create", xhr: true
    it_behaves_like "PUT :update", xhr: true
    it_behaves_like "DELETE :destroy", xhr: true
  end
end
