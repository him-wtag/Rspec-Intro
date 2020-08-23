# Mocks

### double
generate object with method and their return type 

```
RSpec.describe 'a random double' do
  it 'only allows defined methods' do
    stuntman = double('Mr. Danger', fall: 'Ouch!', jump: 'Yess!')

    expect(stuntman.fall).to eq('Ouch!')
    allow(stuntman).to receive(:jump).and_return('Yes!')
    expect(stuntman.jump).to eq('Yes!')

    # rceives a hash of methods and return types
    allow(stuntman).to receive_messages(fall: 'Ok!', jump: 'Done!')
    expect(stuntman.fall).to eq('Ok!')
    expect(stuntman.jump).to eq('Done!')
  end
end

```
### Recieve counts

```
  RSepc.describe Movie do 
  let(:stuntman) { double("Mr. Danger", ready?: true, act: 'Any string' ) }

  subject { described_class.new(stuntman) }


  expect(stuntman).to receive(:act).once
  expect(stuntman).to receive(:ready).exactly(1).times
  # others 
  - at_least
  - at_most

```
### allow mehthod

Allows us to pair a method with a given return value. 

```
  mock_arr = double

  allow(mock_arr).to receive(:pop).and_return(:c, :b, nil) #returns nil for every call after calling pop twice

  expect(mock_arr).to eq(:c)
  expect(mock_arr).to eq(:d)
  expect(mock_arr).to be_nil
  expect(mock_arr).to be_nil

```

### matching arguments
return values based on the arguments 
here we are mocking `first` methods which returning values based on the arguments it is recieving
```
RSpec.describe 'matching arguments' do 

  it 'can return different values on the arguments' do
    arr = [ 1, 2, 3 ]

    allow(arr).to receive(:first).with(no_args).and_return(arr.last)
    allow(arr).to receive(:first).with(2).and_return([arr[1], arr[2]])

    expect(arr.first).to eq(arr.last)
    expect(arr.first(2)).to eq([2, 3])
  end
end

```


### instance method
check the class for existing method with exact number of arguments before mocking. 

```
class Person
  def a 
    sleept(3)
    "Hello"
  end
end

RSpec.describe Person do 
  describe 'regular double' do
    it 'can implement any method' do 
      # person = instance_double(Person, a: 'Hello', b: 'Bye') # will throw error

      person = instance_double(Person)
      allow(person)
end

```

### class doubles

like instance doubles used to mock instance methods, class methods is used to mock class methods. 
If we dont want to call the class , we can stringify class name like 'Deck' inside `class_doubles`. 

`as_stubbed_const` determines that any subsequent call the `Deck` class will be refert to the mock `Deck`. 
For example inside the `start` method

```
class Deck
  def self.build
    # Business logic to build a whole bunch of cards
  end
end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build
  end
end

RSpec.describe CardGame do
  it 'can only implement class methods that are defined on a class' do
    deck_klass = class_double(Deck, build: ['Ace', 'Queen']).as_stubbed_const

    expect(deck_klass).to receive(:build)
    subject.start
    expect(subject.cards).to eq(['Ace', 'Queen'])
  end
end

```
