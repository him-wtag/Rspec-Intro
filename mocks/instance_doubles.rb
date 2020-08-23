class Person
  def greet(seconds)
    sleep(seconds)
    "Hello"
  end
end

RSpec.describe Person do 
  describe 'instance double' do
    it 'can only implement methods defined in the class' do 
      person = instance_double(Person, greet: 'Hello') # will throw error
      seconds = 10
      allow(person).to receive(:greet).with(seconds).and_return('Hello')

      expect(person.greet(5)).to eq('Hello')
    end
  end
end