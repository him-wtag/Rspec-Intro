class User
  def login(email, pasword); end

  def signpup; end
end

RSpec.describe User do
  it { is_expected.to respond_to(:login).with(2).arguments }
  it { is_expected.to respond_to(:login) }
end
