require 'spec_helper'

describe LG::Net::CIDR do
  let!(:mod) { LG::Net::CIDR }

  describe '.mask' do
    let(:mask_tests) {
      Proc.new {
        params.each do |param|
          expect(mod.mask(param[:ip1], param[:ip2])).to eql param[:expected]
        end
      }
    }

    context 'when ips are valid' do
      context 'strings' do
        let(:params) {[
          { ip1: "0.0.0.0", ip2: "0.0.0.0", expected: 32 },
          { ip1: "0.0.0.0", ip2: "0.0.0.255", expected: 24 },
          { ip1: "24.56.0.0", ip2: "24.56.255.255", expected: 16 },
          { ip1: "9.0.0.0", ip2: "9.255.255.255", expected: 8 },
          { ip1: "9.0.0.0", ip2: "9.0.0.63", expected: 26 },
          { ip1: "100.0.0.0", ip2: "100.0.63.255", expected: 18 },
          { ip1: "2.0.0.0", ip2: "2.63.255.255", expected: 10 }
        ]}

        it 'correctly masks' do
          mask_tests.call
        end
      end

      context 'integers' do
        let(:params) {[
          { ip1: 0, ip2: 255, expected: 24 },
          { ip1: 0, ip2: 63, expected: 26 }
        ]}

        it 'correctly masks' do
          mask_tests.call
        end
      end

      context 'integer / string combinations' do

      #   mask_tests.call
      end
    end

    context 'when ips are invalid' do
      let(:params) {[
        { ip1: 0, ip2: 64, expected: -1 },
        { ip1: "12.1.1.14", ip2: "12.1.1.255", expected: -1 }
      ]}

      it 'returns -1' do
        mask_tests.call
      end
    end

  end

  describe '.end_address' do
    let(:mask_tests) { Proc.new {
      params.each do |param|
        expect(mod.end_address(param[:ip], param[:mask])).to eql param[:expected]
      end
    }}

    let(:cidr_tests) { Proc.new {
      params.each do |param|
        expect(mod.end_address(param[:cidr])).to eql param[:expected]
      end
    }}

    context 'valid ip string and mask' do
      let(:params) {[
        { ip: "0.0.0.0", mask: 32, expected: 0 },
        { ip: "0.0.0.0", mask: 24, expected: 255 }
      ]}

      it 'finds the end address' do
        mask_tests.call
      end
    end

    context 'valid ip integer and mask' do
      let(:params) {[
        { ip: 0, mask: 32, expected: 0 },
        { ip: 0, mask: 23, expected: 511 }
      ]}

      it 'finds the end address' do
        mask_tests.call
      end
    end

    context 'valid cidr string' do
      let(:params) {[
        { cidr: "0.0.0.0/32", expected: 0 },
        { cidr: "0.0.0.0/24", expected: 255 }
      ]}

      it 'finds the end address' do
        cidr_tests.call
      end
    end


    context 'invalid cidrs' do
      let(:params) {[
        { cidr: "0.0.0.0/33", expected: -1 },
        { cidr: "0.0.0.0/0", expected: -1 },
        { cidr: "0.0.0.1111/0", expected: -1 }
      ]}

      it 'returns -1' do
        cidr_tests.call
      end
    end

    context 'invalid ips' do
      let(:params) {[
        { ip: 0, mask: 33, expected: -1 }
      ]}

      it 'returns -1' do
        mask_tests.call
      end
    end
  end

  describe '.to_string' do
    let(:params) {[
      { ip1: 0, ip2: 0, expected: "0.0.0.0/32" },
      { ip1: 0, ip2: 255, expected: "0.0.0.0/24" },
      { ip1: "0.0.0.0", ip2: "0.0.0.0", expected: "0.0.0.0/32" },
      { ip1: "0.0.0.0", ip2: "0.0.0.255", expected: "0.0.0.0/24" }
    ]}

    it 'provides a cidr string' do
      params.each do |param|
        expect(mod.to_string(param[:ip1],param[:ip2])).to eql param[:expected]
      end
    end
  end

  describe '.valid?' do
    it 'should return false with an invalid cidr mask' do
      LG::Net::CIDR.valid?("192.168.1.1/9999").should be_false
    end

    it 'should return false with an invalid ip' do
      bad_ips = [
        "300.168.1.1/24",
        "192.300.1.1/24",
        "192.168.300.1/24",
        "192.168.1.300/24"
      ]

      bad_ips.each do |bad_ip|
        LG::Net::CIDR.valid?(bad_ip).should be_false
      end
    end

    it 'should return true for a valid cidr' do
        LG::Net::CIDR.valid?('192.168.100.0/24').should be_true
    end
  end

end

