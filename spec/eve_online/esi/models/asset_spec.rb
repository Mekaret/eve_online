require 'spec_helper'

describe EveOnline::ESI::Models::Asset do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:assets) { described_class.new(options) }

    before { expect(assets).to receive(:type_id).and_return(2629) }

    before { expect(assets).to receive(:location_id).and_return(60_008_674) }

    before { expect(assets).to receive(:location_type).and_return('station') }

    before { expect(assets).to receive(:item_id).and_return(1_006_604_012_678) }

    before { expect(assets).to receive(:location_flag).and_return('Hangar') }

    before { expect(assets).to receive(:is_singleton).and_return(false) }

    before { expect(assets).to receive(:quantity).and_return(16_156) }

    subject { assets.as_json }

    its([:type_id]) { should eq(2629) }

    its([:location_id]) { should eq(60_008_674) }

    its([:location_type]) { should eq('station') }

    its([:item_id]) { should eq(1_006_604_012_678) }

    its([:location_flag]) { should eq('Hangar') }

    its([:is_singleton]) { should eq(false) }

    its([:quantity]) { should eq(16_156) }
  end

  describe '#type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['type_id']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('type_id')
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#location_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['location_id']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('location_id')
        end
      end
    end

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#location_type' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['location_type']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('location_type')
        end
      end
    end

    specify { expect { subject.location_type }.not_to raise_error }
  end

  describe '#item_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['item_id']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('item_id')
        end
      end
    end

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe '#location_flag' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['location_flag']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('location_flag')
        end
      end
    end

    specify { expect { subject.location_flag }.not_to raise_error }
  end

  describe '#is_singleton' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['is_singleton']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('is_singleton')
        end
      end
    end

    specify { expect { subject.is_singleton }.not_to raise_error }
  end

  describe '#quantity' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['quantity']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('quantity')
        end
      end
    end

    specify { expect { subject.quantity }.not_to raise_error }
  end
end