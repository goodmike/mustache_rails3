require 'spec_helper'

describe Mustache::Rails do

  before do
    @handler = Mustache::Rails::TemplateHandler.new
    @template = mock(ActionView::Template, :virtual_path => "foo/action")
    Mustache::Rails::Config.default!
  end

  it "looks for templates by default in app/templates for templates with a .mustache extension" do
    File.stub(:exists?).and_return(true)
    @handler.send(:mustache_template_file, @template).should == "#{Rails.root}/app/templates/foo/action.html.mustache"
  end

  it "raises an error if it can't find the template that you're looking for" do
    File.stub(:exists?).and_return(false)
    expect {@handler.send(:mustache_template_file, @template)}.to raise_error(ActionView::MissingTemplate)
  end

  it "can find mustache templates from multiple configured places" do
    Mustache::Rails::Config.template_paths << "my/other/template/place"
    File.should_receive(:exists?).with(Rails.root.join("app/templates/foo/action.html.mustache")).and_return(false)
    File.should_receive(:exists?).with(Rails.root.join("my/other/template/place/foo/action.html.mustache")).and_return(true)
    @handler.send(:mustache_template_file, @template).should == "#{Rails.root}/my/other/template/place/foo/action.html.mustache"
  end

  describe "backwards compatibility" do
    it "supports using the template_base_path as the first entry in the template paths array" do
      Mustache::Rails::Config.template_base_path.should == Rails.root.join("app/templates")
      Mustache::Rails::Config.template_paths << "another/path"
      Mustache::Rails::Config.template_base_path.should == Rails.root.join("app","templates")
      Mustache::Rails::Config.template_base_path = "foo/bar"
      Mustache::Rails::Config.template_paths.should == ["foo/bar", "another/path"]
    end
  end
end
