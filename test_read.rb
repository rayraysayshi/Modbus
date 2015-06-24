require 'rmodbus'

ModBus::TCPClient.connect('192.168.2.254', 502) do |cl|

  i = 2879
  j = 2880

    cl.with_slave(1) do |slave|

      while j < 3200

        reg = slave.holding_registers[i..j]
        reg_read = reg.to_32f
        x = reg_read.delete_if { |y| y < 0.001 }
        puts "Address: #{i} - #{j} ||  Register value:  #{x} ||         #{reg}"

        i += 2
        j += 2

      end

    end

end
