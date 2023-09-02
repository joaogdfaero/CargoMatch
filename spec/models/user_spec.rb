require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: "João",
      cpf: '712.964.240-81',
      driver: false,
      email: "joao@email.com",
      password: "123456")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(User.new(name = nil)).to_not be_valid
  end

  it "is not valid without a valid cpf" do
    subject.cpf = '712.964.2401'
    expect(subject).to_not be_valid
  end

  it "is not valid without a driver check" do
    subject.driver = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
