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
