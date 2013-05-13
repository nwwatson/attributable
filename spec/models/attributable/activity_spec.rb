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
end
