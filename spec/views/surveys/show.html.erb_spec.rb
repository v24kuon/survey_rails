require 'rails_helper'

RSpec.describe "surveys/show", type: :view do
  before(:each) do
    assign(:survey, Survey.create!(
      title: "Title",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
