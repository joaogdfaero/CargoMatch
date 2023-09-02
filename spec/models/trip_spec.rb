require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:user) { create(:user) } 

  it 'is valid with all required attributes' do
    trip = build(:trip, user: user)
    expect(trip).to be_valid
  end

  it 'is invalid without departure_location' do
    trip = build(:trip, user: user, departure_location: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without arrival_location' do
    trip = build(:trip, user: user, arrival_location: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without departure_date' do
    trip = build(:trip, user: user, departure_date: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without arrival_date' do
    trip = build(:trip, user: user, arrival_date: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without departure_time' do
    trip = build(:trip, user: user, departure_time: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without arrival_time' do
    trip = build(:trip, user: user, arrival_time: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without trip_type' do
    trip = build(:trip, user: user, trip_type: nil)
    expect(trip).not_to be_valid
  end

  it 'is invalid without a user' do
    trip = build(:trip, user: nil)
    expect(trip).not_to be_valid
  end
end
