# Subject


### [Implicit Subject](025-implicit-subject-spec.rb)

Initialize an object from the class mentioned in `Rspec.describe` line

```
  Rspec.describe Hash do
      # let(:subject) { Hash.new }
      it 'should start off empty' do
        puts subject
        puts subject.class
        expect(subject.length).to eq(0)
      end
  end
```

### [Explicit Subject](026-explicit-subject-spec.rb)

We can use explicit subject to give subject a name. Though it's also okey to not use subject. For example we can use `let` in this case to define a hash.

```
Rspec.describe Hash do
  subject(:bob) do
    { a: 1, b: 2 }
  end

  ## let(:bob) { {a:1 , b: 2} }

  it 'has a key-value paris' do
    expect(subject.length).to eq(2)
    expect(bob.length).to eq(2)
  end 
end
```

### [Describe Class](027-described-class-spec.rb)
Dynamically refer to the `ClassName` in `RSpec.describe ClassName` 

```
class King
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

Rspec.describe King do
  # subject { King.new('Boris') }
  subject { described_class.new('Boris) }

  it 'represents a great king' do
    expect(subject.name).to eq('Boris)
  end
end

```


### One liner example with subject

```
RSpec.describe 'shorthand syntax' do
  subject { 5 }

  context 'with classic syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to eq(5) }
  end
end
```

Output:
```
  shorthand syntax
    with classic sytax
      should equal 5
    with one-liner syntax
      should eq 5
```

### [Shared Example](029-shared-examples-spec.rb)

Group common examples with `RSpec.shared_example` to be used withing other tests so that we can avoid code duplications.

```
RSpec.shared_example 'A ruby object with three elements' do
  it 'returns number of items' do
    # expect something
    expect(subject.length).to eq(3)
  end
end

RSpec.describe Array do
  subject { [1, 2, 3] }
  include_example 'A ruby object with three elements'
end

```

### [Shared Context](030-shared-context-spec.rb)
Shared context allows to extract common business logic a separate file. 

```
RSpec.shared_context 'common' do
  before do
    @foods = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3] }
end

RSpec.describe 'first example group' do
  include_context 'common'
  # can use the shared context resources here
end

RSpec.describe 'second example in different file' do
  include_context 'common'
  # can use the shared context resources here
end

```