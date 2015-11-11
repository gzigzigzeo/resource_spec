# ResourceSpec

[![Build Status](https://travis-ci.org/gzigzigzeo/resource_spec.svg)](http://travis-ci.org/gzigzigzeo/resource_spec/fias)

<a href="https://evilmartians.com/?utm_source=resource_spec-gem">
<img src="https://evilmartians.com/badges/sponsored-by-evil-martians.svg" alt="Sponsored by Evil Martians" width="236" height="54">
</a>

Test your RESTful Rails controllers with ease.

### Motivation

In every Rails app we have a set of controllers which encapsulates simple CRUD logic, especially in the admin area. Most of such controllers stays uncovered: it often seems excessive to test typical things. In other hand, in such typical places there always exists some unusual logic, which had to be tested. Furthermore, 100% test coverage rocks.

## Simple Use Case

Given we have [typical REST controller](spec/dummy/app/controllers/users_controller.rb).

It can be tested with a few lines of code:

```ruby
include_context "ResourceSpec", User do
  it_behaves_like "GET :new"
  it_behaves_like "POST :create"
  it_behaves_like "GET :edit"
  it_behaves_like "PUT :update"
  it_behaves_like "DELETE :destroy"
  it_behaves_like "GET :index"
end
```

`FactoryGirl` factory for `User` must be defined. Calls to `FactoryGirl` or other factory engine can be overridden with settings.

## Customization

Take a look at [default settings](lib/resource_spec/context.rb). All of these settings can be changed inside `include_context` block.

Some examples:

### Redirect to `#index` instead of `#show` on create

Define override context somewhere in `support` folder:

```ruby
RSpec.shared_context "ResourceSpec overrides" do
  let(:success_resource_url) { controller.url_for(action: :index) }
end
```

Then include:

```ruby
include_context "ResourceSpec", User do
  include_context "ResourceSpec overrides"

  ...
end
```

### Nesting

This will make nested resources like `/category/:category_id/groups` work:

```ruby
  let(:category) { create(:category) }

  include_context "ResourceSpec", Group do
    let(:url_args) { { category_id: category.id } }

    ...
  end
```

### Skipping passwords

`POST :create` and `PUT :update` examples are checking the record on compliance between params passed by request and record values saved to database. Some fields like images, generated tokens, encrypted passwords must be skipped.

```ruby
include_context "ResourceSpec", User do
  let(:not_expected_params) do
    %i(password password_confirmation last_sign_in_at)
  end

  ...
end

```

### Timestamps

If you have any DateTime fields in your model - freeze the time:

```ruby
around { |example| travel_to(Time.now, &example) }
```

If you have Date columns - use `#to_date` in factory.

### Additional action expectations

```ruby
include_context "ResourceSpec", User do
  it_behaves_like "GET :new" do
    after { expect(response.body).to include("form") }
  end
  ...
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "resource_spec"
```

And this to `spec_helper.rb`:

```ruby
require "resource_spec/all"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resource_spec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gzigzigzeo/resource_spec.
