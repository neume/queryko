require 'spec_helper'

RSpec.describe Queryko::Filters::After do
  let(:feature) { double('feature') }
  let(:options) do
    {
      table_name: 'products',
      column_name: 'id'
    }
  end
  let(:filter) { described_class.new(options, feature) }
  let(:index) { Product.all[1].id }

  before do
    5.times do |x|
      Product.create(name: "Product #{x}")
    end
  end


  it { expect(filter.perform(Product.all, index).count).to eq(3) }
end
