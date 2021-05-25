module CsvSimpleExport
  RSpec.describe Main do
    describe '#csv_simple_export' do
      context 'Example 1' do
        let(:input) { 'foo' }
        let(:result) { 'foo' }
        it do
          expect(subject.csv_simple_export(input)).to eql(result)
        end
      end
    end
  end
end
