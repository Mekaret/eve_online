require 'spec_helper'

describe EveOnline::Exceptions::UnauthorizedException do
  specify { expect(subject).to be_a(EveOnline::Exceptions::Base) }
end
