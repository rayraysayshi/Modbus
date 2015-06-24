
require 'rmodbus'

class ModbusFetch

  def pid_loop_fetch(pid)

    Modbus::TCPClient.connect('192.168.1.254', 502) do |cl|

      i = 65
      j = 66

      cl.with_slave(1) do |slave|
        while j < 256
          reg = slave.holding_registers[i..j]
          reg_unpack = reg.to_32f

          i += 2
          j += 2

        end

      end

    end

  end

end






ModBus::TCPClient.connect('192.168.2.253', 502) do |cl|

  i = 2879
  j = 2880

    cl.with_slave(1) do |slave|

      while j < 3200

        reg = slave.holding_registers[i..j]
        reg_read = reg.to_32f
        x = reg_read.delete_if { |y| y < 0.001 }
        puts "Address: #{i} - #{j} ||  Register value:  #{x}"

        i += 2
        j += 2

      end

    end

end



  #$testdata = 0

  def data_fetch()

    #<%= data_fetch %>

    Net::SSH.start('76.120.36.231', :username => 'Gregory Perrin', :password => 'pnp86ksp') do |session|

      ModBus::TCPClient.connect('192.168.1.254', 502) do |cl|

          i = 2879
          j = 2880

            cl.with_slave(1) do |slave|

              while j < 3200

                reg = slave.holding_registers[i..j]
                reg_read = reg.to_32f
                x = reg_read.delete_if { |y| y < 0.001 }
                $testdata[x.size] = "Address: #{i} - #{j} ||  Register value:  #{x}"
                puts $testdata[x.size]

                i += 2
                j += 2

              end

            end

          end

      end


  end

end

