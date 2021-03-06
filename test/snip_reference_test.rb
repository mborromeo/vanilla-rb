require "test_helper"

class SnipReferenceTest < Vanilla::TestCase
  def setup
    super
    create_snip :name => "test", :content => "snip content"
  end

  should "match simple snips" do
    assert_equal "rendering snip content", render("rendering {test}")
  end

  should "match snips with an argument" do
    assert_equal "rendering snip content", render("rendering {test arg1}")
  end

  should "match snips with several arguments" do
    assert_equal "rendering snip content", render("rendering {test arg1, arg2}")
  end

  should "match snips with hyphens" do
    create_snip :name => "test-snip", :content => "snip content"
    assert_equal "rendering snip content", render("rendering {test-snip}")
  end

  should "match snips with underscores" do
    create_snip :name => "test_snip", :content => "snip content"
    assert_equal "rendering snip content", render("rendering {test_snip}")
  end

  should "match snips with numbers" do
    create_snip :name => "test1", :content => "snip content"
    assert_equal "rendering snip content", render("rendering {test1}")
  end

  should "ignore references that are rubyish" do
    assert_equal "10.times { |x| puts x }", render("10.times { |x| puts x }")
    assert_equal "10.times {|x| puts x }", render("10.times {|x| puts x }")
  end

  private

  def render(content)
    snip = create_snip :name => "test-content", :content => content
    Vanilla::Renderers::Base.new(@app).render(snip)
  end
end