require 'test_helper'

describe 'Sandi Meter Results' do
  before :all do
    @pwd = %x{ pwd }
    @results = %x{ sandi_meter --path ./app }
    @classes,@methods,@parameters,@controllers = @results.scan(/(...)[%]/).flatten.map{ |s| s.to_i }
  end

  it '100% of classes are under 100 lines' do
    @classes.must_equal 100
  end

  it '100% of methods are under 5 lines' do
    @methods.must_equal 100
  end

  it '100% of method calls accepted are less than 4 parameters' do
    @parameters.must_equal 100
  end

  it '100% of controllers have one instance variable per action' do
    @controllers.must_equal 100
  end
end
