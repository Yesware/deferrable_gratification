require 'deferrable_gratification'

describe DeferrableGratification::Primitives do
  describe '.success' do
    describe 'DG.success' do
      subject { DG.success }

      it { should succeed_with_anything }
    end

    describe 'DG.success(42)' do
      subject { DG.success(42) }

      it { should succeed_with 42 }
    end

    describe 'DG.success(:foo, :bar, :baz)' do
      subject { DG.success(:foo, :bar, :baz) }

      it { should succeed_with [:foo, :bar, :baz] }
    end
  end


  describe '.const' do
    describe 'DG.const("Hello")' do
      subject { DG.const("Hello") }

      it { should succeed_with('Hello') }
    end
  end


  describe '.failure' do
    describe 'DG.failure("does not compute")' do
      subject { DG.failure("does not compute") }
      
      it { should fail_with(RuntimeError, 'does not compute') }
    end

    describe 'DG.failure(ArgumentError)' do
      subject { DG.failure(ArgumentError) }

      it { should fail_with(ArgumentError) }
    end

    describe 'DG.failure(ArgumentError, "unacceptable command")' do
      subject { DG.failure(ArgumentError, "unacceptable command") }

      it { should fail_with(ArgumentError, 'unacceptable command') }
    end

    describe 'DG.failure(RangeError.new("you shall not pass!"))' do
      subject { DG.failure(RangeError.new("you shall not pass!")) }

      it { should fail_with(RangeError, 'you shall not pass!') }
    end
  end

  describe '.failure_value' do
    describe 'DG.failure_value with a string' do
      subject { DG.failure_value('i am a string') }

      it 'fails with the specified string' do
        error = nil
        subject.errback do |err|
          error = err
        end

        error.should == 'i am a string'
      end
    end

    describe 'DG.failure_value with an arbitrary object' do
      let(:obj) { double(Object) }
      subject { DG.failure_value(obj) }

      it 'fails with the specified object' do
        error = nil
        subject.errback do |err|
          error = err
        end

        error.should equal obj
      end
    end
  end
end
