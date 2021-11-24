require_relative '../label'
require 'date'
require_relative '../item'

describe Label do
  before(:each) do
    @label1 = Label.new('titlelabel', 'yellow')
  end

  it 'is an instance of the class?' do
    expect(@label1).to be_instance_of Label
  end

  it 'Check the title of the label' do
    expect(@label1.title).to eql 'titlelabel'
  end

  it 'Check the color of the label' do
    expect(@label1.color).to eql 'yellow'
  end

  it 'Add method to' do
    item1 = Item.new(Date.new(2010, 0o2, 23))
    @label1.add_item(item1)
    expect(@label1.items).to include(item1)
  end
end
