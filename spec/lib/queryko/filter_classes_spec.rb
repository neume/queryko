require 'spec_helper'

RSpec.describe Queryko::Naming do
  let(:query_object_class) do
    Class.new do
      include Queryko::FilterClasses
    end
  end
  let(:defined_filter_classes) { 8 }

  let(:query_object) { query_object_class.new }
  let(:initial_count) { query_object.filters.count }

  context 'with default filters' do
    it { expect(query_object.filters.count).to eq defined_filter_classes }
  end

  context 'with custom filters' do
    let(:query_object_class) do
      Class.new do
        include Queryko::FilterClasses
        filter_class :queryko, Queryko
        filter_class :example, "Queryko::Filters::Before"
      end
    end
    it { expect(query_object.filters.count).to eq(defined_filter_classes + 2) }
    it { expect(query_object.filters[:queryko]).to eq Queryko }
    it { expect(query_object.filters[:example]).to eq Queryko::Filters::Before }
  end
end

