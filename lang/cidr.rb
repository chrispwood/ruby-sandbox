module LG
  module Net

    module CIDR

      # Determines the netmask for two IP addresses. Returns -1 for addresses that create an invalid mask.
      # Accepts both integer and dotted quad notation addresses.
      def self.mask(ip1,ip2)
        ip1 = LG::Net::IPv4.to_i(ip1) if ip1.is_a?(String)
        ip2 = LG::Net::IPv4.to_i(ip2) if ip2.is_a?(String)
        diff = (ip2 - ip1).abs + 1
        # Ensure diff is a power of 2
        n = diff
        count = 0
        while ( n != 0 )
          count = count + 1
          return -1 if count > 1
          n = n & (n-1)
        end
        mask = 32
        mask.downto(1) do |x|
          break if diff == 0
          mask = x
          diff = diff >> 1
        end
        mask
      end


      # Determine the start IP address for a cidr block, as an integer. Only accepts a string CIDR block. Returns -1 for invalid IP/netmask combinations.
      def self.start_address(cidr)
        start_ip = -1
        if (cidr.is_a?(String) && cidr =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,2}/ && cidr.split("/")[1].to_i < 33 && cidr.split("/")[1].to_i > 0 )
          ip,netmask = cidr.split("/")
          start_ip = LG::Net::IPv4.to_i(ip)
        end
        start_ip
      end


      # Determine the ending IP address for a cidr block. Returns -1 for invalid IP/netmask combinations.
      def self.end_address(ip1,mask=-1)
        end_ip = -1
        mask = mask.to_i
        if ( mask < 0 )
          # Make sure the address is a string and has a mask suffix
          if (ip1.is_a?(String) && ip1 =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,2}/ && ip1.split("/")[1].to_i < 33 && ip1.split("/")[1].to_i > 0 )
            ip,netmask = ip1.split("/")
            ip = LG::Net::IPv4.to_i(ip)
            netmask = netmask.to_i
            end_ip = LG::Net::CIDR.process_end_address(ip,netmask)
          end
        elsif ( mask < 33 )
          ip1 = LG::Net::IPv4.to_i(ip1) if ip1.is_a?(String)
          end_ip = LG::Net::CIDR.process_end_address(ip1,mask)
        end
        end_ip
      end


      # Returns a CIDR address in standard CIDR string form.
      # Accepts both integer and dotted quad notation addresses.
      def self.to_string(ip1,ip2)
        ip1 = LG::Net::IPv4.to_i(ip1) if ip1.is_a?(String)
        ip2 = LG::Net::IPv4.to_i(ip2) if ip2.is_a?(String)
        LG::Net::IPv4.to_string(ip1) + "/" + mask(ip1,ip2).to_s
      end


      def self.process_end_address(ip,mask) #:nodoc:
        add = 1
        mask.upto(31) do
          add = add << 1
        end
        add = add - 1
        ip + add
      end

      # Determines the starting IP address of the block the given IP address falls in according to the mask
      def self.start_of_block(ip,mask)
        ip = LG::Net::IPv4.to_i(ip) if ip.kind_of?(String)
        ip >> mask << mask
      end


      # Determine if the supplied string is a valid CIDR block
      def self.valid?(cidr)
        ip,mask = cidr.split("/")
        mask = mask.to_i

        return false if not valid_mask? mask

        valid = true

        ip_parts = ip.split(".").collect { |x| x.to_i }
        ip_parts.each do |x|
          valid = false if (x > 255 || x < 0)
        end

        return false if not valid

        ip_int = LG::Net::IPv4.to_i(ip)
        mask_check = 2**32 - 2**(32-mask)
        check_ip_int = ip_int & mask_check
        valid = false if check_ip_int != ip_int

        valid
      end

      def self.valid_mask?(mask)
        mask = mask.to_i
        mask <= 32 && mask >= 1
      end

      class << self
        alias_method :to_s, :to_string
      end
    end

  end
end
