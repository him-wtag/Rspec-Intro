RSpec.describe 'raise_error matcher' do

  def some_method
    x
  end

  class CustomError < StandardError; end

  it 'can check for a specific error' do
    expect { some_method }.to raise_error(NameError)
    # expect { some_method }.to raise_error
    expect { 10 / 0 }.not_to raise_error
  end

  it 'can check for a user-created error' do
    expect { raise CustomError }.to raise_error(CustomError)
  end
end
