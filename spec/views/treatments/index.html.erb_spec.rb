require 'rails_helper'

RSpec.describe "treatments/index", type: :view do
  before(:each) do
    assign(:treatments, [
      Treatment.create!(
        title: "Title",
        description: "MyText",
        local: "Local",
        kind: 2,
        appointment: nil
      ),
      Treatment.create!(
        title: "Title",
        description: "MyText",
        local: "Local",
        kind: 2,
        appointment: nil
      )
    ])
  end

  it "renders a list of treatments" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Local".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
