RSpec.describe 'matching arguments' do 

  it 'can return different values on the arguments' do
    arr = [ 1, 2, 3 ]

    allow(arr).to receive(:first).with(no_args).and_return(arr.last)
    allow(arr).to receive(:first).with(2).and_return([arr[1], arr[2]])

    expect(arr.first).to eq(arr.last)
    expect(arr.first(2)).to eq([2, 3])
  end
end
