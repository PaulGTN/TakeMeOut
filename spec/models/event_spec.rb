require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do 
    @event = FactoryBot.create(:event)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:event)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end

    describe "#start_date" do
      it { expect(@event).to validate_presence_of(:start_date) }
    end

    describe "#duration" do
      it { expect(@event).to validate_presence_of(:duration) }
      it { expect(@event.duration % 5).to be (0) }
      it { is_expected.to_not allow_value(-5).for(:duration) }
    end

    describe "#title" do
      it { expect(@event).to validate_presence_of(:title) }
    end

    describe "#description" do
      it { expect(@event).to validate_presence_of(:description) }
    end

    describe "#price" do
      it { expect(@event).to validate_presence_of(:price) }
    end

    describe "#location" do
      it { expect(@event).to validate_presence_of(:location) }
    end
  end

  context "associations" do
      it { should belong_to(:admin).class_name("User") }
      it { should have_many(:attendances) }
  end

  context "public instance methods" do

    describe "#price" do
    it { expect(@event.price).to be_a(Integer) }
    end

  end 

end
