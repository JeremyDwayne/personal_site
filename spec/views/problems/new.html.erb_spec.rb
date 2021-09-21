require 'rails_helper'

RSpec.describe "problems/new", type: :view do
  before(:each) do
    assign(:problem, Problem.new(
      title: "MyString",
      source: "MyString",
      code: "MyText"
    ))
  end

  it "renders new problem form" do
    render

    assert_select "form[action=?][method=?]", problems_path, "post" do

      assert_select "input[name=?]", "problem[title]"

      assert_select "input[name=?]", "problem[source]"

      assert_select "textarea[name=?]", "problem[code]"
    end
  end
end
