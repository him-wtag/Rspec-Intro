# Introduction

RSpec uses the words "describe" and "it" so we can
express concepts like a conversation:

The describe method creates an example group. Within the block passed to
describe you can declare nested groups using the describe or context
methods, or you can declare examples using the it or specify methods.

Under the hood, an example group is a class in which the block passed to
describe or context is evaluated. The blocks passed to it are evaluated
in the context of an instance of that class.

```
RSpec.describe Account do
  it "has a balance of zero when first opened" do
    # example code goes here - for more on the
    # code inside the examples, see rspec-expectations
    # and rspec-mocks
  end
end

```
- [Before and After hooks](https://relishapp.com/rspec/rspec-core/v/3-9/docs/hooks/before-and-after-hooks)
- [Let and Let!](https://relishapp.com/rspec/rspec-core/v/3-9/docs/helper-methods/let-and-let)