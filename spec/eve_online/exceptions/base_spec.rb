require 'spec_helper'

describe EveOnline::Exceptions::Base do
  specify { expect(subject).to be_a(RuntimeError) }
end
