# -*- encoding: utf-8 -*-
require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

ruby_version_is '1.8.7' do
  describe "IO#lines" do
    before :each do
      @io = IOSpecs.io_fixture "lines.txt"
    end

    after :each do
      @io.close unless @io.closed?
    end

    it "returns an Enumerator" do
      enum = @io.lines
      enum.instance_of?(enumerator_class).should be_true
    end

    it "returns a line when accessed" do
      enum = @io.lines
      enum.first.should == IOSpecs.lines[0]
    end

    it "yields each line to the passed block" do
      ScratchPad.record []
      @io.lines { |s| ScratchPad << s }
      ScratchPad.recorded.should == IOSpecs.lines
    end
  end
end
