require 'spec_helper'

describe Attributable::Activity do
  before :each do
    @activity = Attributable::Activity.new

  end

  it "should require an action" do
    @activity.should have(1).errors_on(:action)
    @activity.action = "create"
    @activity.should have(0).errors_on(:action)
  end

  it "should not require a notes" do
    @activity.should have(0).errors_on(:notes)
  end

  it "should require a user" do
    @activity.should have(1).errors_on(:user)
    @activity.user = create(:user)
    @activity.should have(0).errors_on(:user)
  end

  it "should require a trackable model" do
    example_model = create(:example_model)
    
    @activity.should have(1).errors_on(:trackable)
    @activity.trackable = example_model
    @activity.should have(0).errors_on(:trackable)
  end

  it "should require a ownable model" do
    @activity.should have(1).errors_on(:ownable)
    @activity.ownable = create(:example_model)
    @activity.should have(0).errors_on(:ownable)
  end

  it "should track changes for a newly created model" do
    example_model = create(:example_model)
    user = create(:user)

    @attr = {
      action: "create",
      user: user,
      trackable: example_model
    }

    @activity = Attributable::Activity.create!(@attr)

    @activity.change_hash.size.should eql(5)
  end

  it "should track changes for an updated model" do
    example_model = create(:example_model)
    example_model.title = "This is the updated attribute"
    example_model.save!

     @attr = {
      action: "create",
      user: create(:user),
      trackable: example_model
    }

    @activity = Attributable::Activity.create!(@attr)

    @activity.change_hash.size.should eql(1)
  end
end
