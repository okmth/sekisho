# Sekisho

## Installation


```ruby
gem 'sekisho'
```

Include Sekisho in your application controller.


```ruby
class ApplicationController < ActionController::Base
  include Sekisho
  include Sekisho::Default::Deny
end
```

```ruby
rails g sekisho:install
```

## Configuration
```ruby
# config/initializers/sekisho_config.rb
Sekisho.configure do |config|
  config.suffix       = "Loyalty"
  config.query_method = :accessible?
  config.shared_dir   = :shared
end
```


## Usage

Generate Policy class for controller

```ruby
rails g sekisho:policy posts index
```
or
```ruby
rails g sekisho:policy users::posts index
```

## Policies

To adapt the policy to the controller, 

```ruby
# app/policies/posts/posts_policy.rb
module Posts
  class PostsPolicy < ApplicationPolicy
    def authorized?
      true
    end
  end
end
```

When policy is applied for each action method,

```ruby
# app/policies/posts/actions/index_policy.rb
module Posts
  module Actions
    class IndexPolicy < PostsPolicy
      def authorized?
        user.admin? || record.user == user
      end
    end
  end
end
```

## Controller
```ruby
# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @posts = Post.all
    authorize!
  end
end

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
