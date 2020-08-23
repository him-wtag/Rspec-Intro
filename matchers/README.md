# Matchers

### `not_to` method

`expect(someting).not_to eq(something)`

### Equality Matchers

- `eq` : Ignores type
- `eql` : tests for same type value
- `equal` or `be` : check for identity / same address

```
describe 'equality matchers'
  let(:c) { [1, 2, 3] }
  let(:d) { [1, 2, 3] }
  let(:e) { c }

  expect(c).to eq(d)
  expect(c).to eql(d)

  expect(c).to equal(e)
  expect(c).to be(e)

  expect(c).not_to equal([1, 2, 3])
end
```
### Predicate Method

`expect(result.even?).to eq(true)`
Equal to
`expect(result).to be_even`

More like this are: 
 - `be_odd`
 - `be_zero`
 - `be_empty`

 Using shorthand syntax

  ```
    describe 0 do
      it { is_expected.to be_zero }
    end
  ```
### `all` Matcher

```
[5, 7, 9].each do |val|
  expect(val).to be_odd
end
```
can be written using `all` matcher like this:

`expect([5,7,9]).to all(be_odd)`
ex-2 : 
 `expect([5,7,9]).to all(be < 10)`


### Truthy and Falsy matcher

Falsy values -- `false` & `nil`

Truthy values -- everything else

- `expect(true).to be_truthy`

- `expect({}).to be_truthy`

- `expect(false).to be_falsy`

- `expect(nil).to be_falsy`

- `expect(nil).to be_nil`

### `change` matcher

```
subject { [1, 2, 3] }

expect{ subject.push(4) }.to change { subject.length }.from(3).to(4)

# or 
expect{ subject.push(4) }.to change { subject.length }.by(1)

# negative change
expect{ subject.pop }.to change { subject.length }.by(-1)

```
### `contain_exactly`

Only check for the elements, ignores the order

```
subject { [1, 2, 3] }

expect(subject).to contain_exactly(1, 2, 3)
expect(subject).to contain_exactly(2, 1, 3)

expect(subject).to contain_exactly(1, 2) # will fail

# using shorthand syntax

it { is_expected.to contain_exactly(1, 2, 3) }
```

### `start_with_and_end_with`

```
describe 'caterpiller' do
  it 'check fo substring'
    expect(subject).to start_with('cat')
    expect(subject).to end_with('piller')
  end
end

```

### `have_attribute`

Check for object attributes and proper values

```
Class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

describe Person.new('Imam', 25 ) do
  it { is_expected.to have_attributes(name: 'Imam', age: 25 ) }
end

```

### `include_matcher`

 for `string` looks for matching substring
 for `array` looks for matching array elements
 for `hash` looks for matching `key` or `key-value` pair

```
  describe 'hot chocolate' do
   it { is_expected.to include('choc') }
   it { is_expected.to include('colate') }
  end

  describe ({ a: 1, b: 2, c: 3 }) do
    it { is_expected.to include(:a, :b) }
    it { is_expected.to include(c: 3, b: 2) }
  end

```

### `raise_error`

```
RSpec.describe 'raise_error matcher' do

  def some_method
    x
  end

  class CustomError < StandardError; end

  it 'can check for a specific error' do
    expect { some_method }.to raise_error(NameError)
    # expect { some_method }.to raise_error
    expect { 10 / 2 }.not_to raise_error
  end

  it 'can check for a user-created error' do
    expect { raise CustomError }.to raise_error(CustomError)
  end
end

```

### `respond_to`
check weather an object responds to a method with or without number of arguments

```
class User
  def login(email, pasword); end

  def signpup; end
end

RSpec.describe User do
  it { is_expected.to respond_to(:login).with(2).arguments }
  it { is_expected.to respond_to(:login) }
end

```

### `satisfy` matcher
Takes a block and match the condition given in block

```
subject { 'racecar' }

it 'is a palindrome'
  expect(subject).to satisfy { |value| value == value.reverse }
end

# more readable error message
it 'is a palindrome'
  expect(subject).to satisfy('be a palindrome') do |value|
   value == value.reverse 
end

```

### compound matchers 

```
RSpec.describe 25 do
  it 'can test for multiple matchers' do
    expect(subject).to be_odd.and be > 20
  end

  it { is_expected.to be_even.or be > 20 }
end

```