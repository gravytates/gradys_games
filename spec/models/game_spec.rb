require 'rails_helper'

describe Game do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_presence_of :genre }
  it { should validate_presence_of :platform }
end
