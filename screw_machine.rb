#!/usr/local/bin/ruby


##################################
# Screw Machine Programming
##################################


#
# This method clears the screen
#
def clear_screen
    system "clear"
    system "cls"
end

#
# This method prompts screen and gets input
#
def prompt(prompt_str)
    print prompt_str
    return STDIN.gets.chomp
end

#
# This method has all the logic
#
def main_menu
    clear_screen()

    puts "\t\t\tMaterial Availability"
    puts " 1.  17-4PH"
    puts " 2.  321"
    puts " 3.  303"
    puts " 4.  304"
    puts " 5.  305"
    puts " 6.  4130"
    puts " 7.  4340"
    puts " 8.  6150"
    puts " 9.  6304"
    puts " 10. 8740"
    puts " 11. C1050"
    puts " 12. C1137"
    puts " 13. ALUMINUM (7075)"
    puts " 14. INCO 718"
    puts " 15. LEAD ALLOY (1113)"
    puts " 16. WASPALOY"
    puts " 17. A286"
    puts " 18. TITANIUM (6AL-4V)"
    puts " 19. CUSTOM 455"
    puts " 20. NONE OF THE ABOVE"
    puts
    puts " 21. EXIT"
    puts
    choice = prompt("ENTER YOUR CHOICE (1-20): ")

    m = nil; sfm = nil; mat = nil

    case choice
    when "1"
        m = "A"; sfm = 90; mat = "17-4PH"
    when "2"
        m = "B"; sfm = 80; mat = "321"
    when "3"
        m = "C"; sfm = 80; mat = "303"
    when "4"
        m = "B"; sfm = 80; mat = "304"
    when "5"
        m = "B"; sfm = 80; mat = "305"
    when "6"
        m = "F"; sfm = 120; mat = "4130"
    when "7"
        m = "G"; sfm = 120; mat = "4340"
    when "8"
        m = "H"; sfm = 140; mat = "6150"
    when "9"
        m = "H"; sfm = 140; mat = "6304"
    when "10"
        m = "J"; sfm = 120; mat = "8740"
    when "11"
        m = "K"; sfm = 100; mat = "C1050"
    when "12"
        m = "F"; sfm = 220; mat = "C1137"
    when "13"
        m = "P"; sfm = 400; mat = "ALUMINUM"
    when "14"
        m = "N"; sfm = 35; mat = "INCO 718"
    when "15"
        m = "P"; sfm = 320; mat = "LEAD ALLOY"
    when "16"
        m = "N"; sfm = 35; mat = "WASPALOY"
    when "17"
        m = "A"; sfm = 55; mat = "A286"
    when "18"
        m = "R"; sfm = 300; mat = "6AL-4V"
    when "19"
        m = "A"; sfm = 55; mat = "CUSTOM 455"
    when "21"
        return
    when "20"
    else
        main_menu()
    end

    clear_screen()

    puts "\t\tScrew Machine Programming Center !\n\n\n\n"
    index = 1.5
    mat = prompt("MATERIAL ................... :  ") if mat == nil
    partnum = prompt("PART NUMBER ................ :  ")
    day = prompt("DATE ....................... :  ")
    puts
    bar = prompt("BAR DIAMETER ............... : ").to_f
    puts "Input smallest BARREL diameter to be machined."
    od = prompt("BARREL DIAMETER ............ : ").to_f
    id = prompt("INSIDE DIAMETER ............ : ").to_f
    odcutoff = prompt("O.D. for CUTOFF ............ : ") .to_f
    partlength = prompt("PART's LENGTH .............. : ").to_f
    formwidth = prompt("MAX. WIDTH OF FORM TOOL .... : ").to_f  
    peckdrill = prompt("PECK DRILL! HOW MANY TIMES?  : ").to_i
    if sfm == nil
        sfm = prompt("SURFACE SPEED .............. : ").to_f
    else
        puts "SURFACE SPEED        : #{sfm}"
    end
    puts "INDEX TIME ................. : #{index}"
    thk = prompt("CUTTING INSERT's THICKNESS . : ").to_f
    puts


    pi = 3.14159
    cutoff1 = ((odcutoff - id) / 2) + 0.015
    rpm = (sfm/0.262/bar).floor()
    rpm = 125 if rpm < 125
    drilldepth = thk + partlength + 0.06
    turning = ((bar - od)/2)
    drilldepth = drilldepth/peckdrill
    t = 0.0625
    depth = (drilldepth/t).floor() + 1
    drilldepth = depth * t
    turn = (turning/t).floor() + 1
    turning = turn * t
    turning = 0.125 if turning < 0.125

    id_size = "SMALL" if id <= 0.1875
    id_size = "MEDIUM" if id >= 0.1876
    id_size = "LARGE" if id >= 0.3751
    id_size = "XLARGE" if id >= 0.5626

    formwidth_size = "SMALL" if formwidth <= 0.25
    formwidth_size = "MEDIUM" if formwidth >= 0.2501
    formwidth_size = "LARGE" if formwidth >= 0.5001
    formwidth_size = "XLARGE" if formwidth >= 0.6251

    thk_size = "SMALL" if thk <= 0.062
    thk_size = "MEDIUM" if thk >= 0.0621
    thk_size = "LARGE" if thk >= 0.1871

    case m
    when "A"
        case id_size
        when "SMALL"
            drillfeed = 0.0025
        when "MEDIUM"
            drillfeed = 0.0028
        when "LARGE"
            drillfeed = 0.0031
        when "XLARGE"
            drillfeed = 0.0037
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0017
        when "MEDIUM"
            turnfeed = 0.0014
        when "LARGE"
            turnfeed = 0.0011
        when "XLARGE"
            turnfeed = 0.0009
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0011
        when "MEDIUM"
            cutofffeed = 0.0013
        when "LARGE"
            cutofffeed = 0.0016
        end
    when "B"
        case id_size
        when "SMALL"
            drillfeed = 0.003
        when "MEDIUM"
            drillfeed = 0.0033
        when "LARGE"
            drillfeed = 0.0036
        when "XLARGE"
            drillfeed = 0.0039
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0019
        when "MEDIUM"
            turnfeed = 0.0016
        when "LARGE"
            turnfeed = 0.0013
        when "XLARGE"
            turnfeed = 0.0012
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0013
        when "MEDIUM"
            cutofffeed = 0.0016
        when "LARGE"
            cutofffeed = 0.002
        end
    when "C"
        case id_size
        when "SMALL"
            drillfeed = 0.0035
        when "MEDIUM"
            drillfeed = 0.004
        when "LARGE"
            drillfeed = 0.0045
        when "XLARGE"
            drillfeed = 0.0055
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0026
        when "MEDIUM"
            turnfeed = 0.0021
        when "LARGE"
            turnfeed = 0.0017
        when "XLARGE"
            turnfeed = 0.0015
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0017
        when "MEDIUM"
            cutofffeed = 0.0021
        when "LARGE"
            cutofffeed = 0.0025
        end
    when "F"
        case id_size
        when "SMALL"
            drillfeed = 0.003
        when "MEDIUM"
            drillfeed = 0.0035
        when "LARGE"
            drillfeed = 0.004
        when "XLARGE"
            drillfeed = 0.0047
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0022
        when "MEDIUM"
            turnfeed = 0.0018
        when "LARGE"
            turnfeed = 0.0016
        when "XLARGE"
            turnfeed = 0.0014
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0015
        when "MEDIUM"
            cutofffeed = 0.002
        when "LARGE"
            cutofffeed = 0.0024
        end
    when "G"
        case id_size
        when "SMALL"
            drillfeed = 0.0025
        when "MEDIUM"
            drillfeed = 0.0028
        when "LARGE"
            drillfeed = 0.0031
        when "XLARGE"
            drillfeed = 0.0037
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0018
        when "MEDIUM"
            turnfeed = 0.0014
        when "LARGE"
            turnfeed = 0.0012
        when "XLARGE"
            turnfeed = 0.0011
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0011
        when "MEDIUM"
            cutofffeed = 0.0014
        when "LARGE"
            cutofffeed = 0.0017
        end 
    when "H"
        case id_size
        when "SMALL"
            drillfeed = 0.0028
        when "MEDIUM"
            drillfeed = 0.0031
        when "LARGE"
            drillfeed = 0.0034
        when "XLARGE"
            drillfeed = 0.0041
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0018
        when "MEDIUM"
            turnfeed = 0.0015
        when "LARGE"
            turnfeed = 0.0012
        when "XLARGE"
            turnfeed = 0.0011
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0012
        when "MEDIUM"
            cutofffeed = 0.0015
        when "LARGE"
            cutofffeed = 0.0018
        end
    when "J"
        case id_size
        when "SMALL"
            drillfeed = 0.003
        when "MEDIUM"
            drillfeed = 0.0033
        when "LARGE"
            drillfeed = 0.0036
        when "XLARGE"
            drillfeed = 0.0044
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0019
        when "MEDIUM"
            turnfeed = 0.0016
        when "LARGE"
            turnfeed = 0.0013
        when "XLARGE"
            turnfeed = 0.0012
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0013
        when "MEDIUM"
            cutofffeed = 0.0016
        when "LARGE"
            cutofffeed = 0.002
        end
    when "K"
        case id_size
        when "SMALL"
            drillfeed = 0.0025
        when "MEDIUM"
            drillfeed = 0.0031
        when "LARGE"
            drillfeed = 0.0037
        when "XLARGE"
            drillfeed = 0.0044
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0017
        when "MEDIUM"
            turnfeed = 0.0014
        when "LARGE"
            turnfeed = 0.0011
        when "XLARGE"
            turnfeed = 0.001
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0011
        when "MEDIUM"
            cutofffeed = 0.0013
        when "LARGE"
            cutofffeed = 0.0016
        end
    when "P"
        case id_size
        when "SMALL"
            drillfeed = 0.0055
        when "MEDIUM"
            drillfeed = 0.0066
        when "LARGE"
            drillfeed = 0.0072
        when "XLARGE"
            drillfeed = 0.008500001
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.004
        when "MEDIUM"
            turnfeed = 0.0036
        when "LARGE"
            turnfeed = 0.0031
        when "XLARGE"
            turnfeed = 0.003
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0033
        when "MEDIUM"
            cutofffeed = 0.0038
        when "LARGE"
            cutofffeed = 0.0044
        end
    when "N"
        case id_size
        when "SMALL"
            drillfeed = 0.001
        when "MEDIUM"
            drillfeed = 0.0015
        when "LARGE"
            drillfeed = 0.0019
        when "XLARGE"
            drillfeed = 0.0022
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0025
        when "MEDIUM"
            turnfeed = 0.002
        when "LARGE"
            turnfeed = 0.0015
        when "XLARGE"
            turnfeed = 0.003
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0012
        when "MEDIUM"
            cutofffeed = 0.0015
        when "LARGE"
            cutofffeed = 0.002
        end  
    when "R"
        case id_size
        when "SMALL"
            drillfeed = 0.001
        when "MEDIUM"
            drillfeed = 0.0015
        when "LARGE"
            drillfeed = 0.0019
        when "XLARGE"
            drillfeed = 0.0022
        end

        case formwidth_size
        when "SMALL"
            turnfeed = 0.0025
        when "MEDIUM"
            turnfeed = 0.002
        when "LARGE"
            turnfeed = 0.0015
        when "XLARGE"
            turnfeed = 0.003
        end

        case thk_size
        when "SMALL"
            cutofffeed = 0.0012
        when "MEDIUM"
            cutofffeed = 0.0015
        when "LARGE"
            cutofffeed = 0.002
        end
    end

    if drillfeed == nil
        drillfeed = prompt("DRILL's FEED .............. : ").to_f
    else
        puts "DRILL's FEED ............. : #{drillfeed}"
    end

    if turnfeed == nil
        turnfeed = prompt("TURN's FEED ............... : ").to_f
    else
        puts "TURN's FEED ............... : #{turnfeed}"
    end

    if cutofffeed == nil
        cutofffeed = prompt("CUT-OFF's FEED ............ : ").to_f
    else
        puts "CUT-OFF's FEED ............  #{cutofffeed}"
    end

    cutofftime = (cutoff1 * 60) / (rpm * cutofffeed)
    drilltime = (drilldepth * 60) / (rpm * drillfeed)
    turntime = (turning * 60) / (rpm * turnfeed)
    r1 = od /2
    d = r1 * (Math.sin((40*pi)/180))
    h1 = r1 - d
    c1 = 2 * (Math.sqrt(h1 * (( 2 *r1) - h1)))
    r = bar /2
    h = r - d
    c2 = 2 * (Math.sqrt(h * ((2 * r) - h)))
    f = (c2 = c1) / 2
    shave = (f/t).floor() + 1
    shave = shave * t
    shave = 0.125 if shave < 0.125
    ct = ((odcutoff = id) / 2) + 0.015
    cutoff = (ct/t).floor() + 1
    cutoff = cutoff * t
    totalrevdrill = drilldepth / drillfeed
    totalrevturn = turning / turnfeed
    totalrevcutoff = cutoff / cutofffeed

    puts "RPM                     : #{rpm}"
    puts "TOTAL REV. FOR DRILL    : #{totalrevdrill}"
    puts "TOTAL REV. FOR TURNING  : #{totalrevturn}"
    puts "TOTAL REV. FOR CUT-OFF  : #{totalrevcutoff}"
    puts "DRILL TIME              : #{drilltime}"
    puts "TURN TIME               : #{turntime}"
    puts "CUT-OFF TIME            : #{cutofftime}"

    if drilltime > turntime && drilltime > cutofftime
        rev_type = "VIENNE"
        rev = totalrevdrill
        machinetime = rev * 60 / rpm
        dwelltime = 0.05 * machinetime
        besttime = machinetime + dwelltime + index
        gross = (3600 / besttime).floor()
        net = (gross * 0.75).floor()
    elsif turntime > drilltime && turntime > cutofftime
        rev_type = "VIENNIE"
        rev = totalrevturn
        machinetime = rev * 60 / rpm
        dwelltime = 0.05 * machinetime
        besttime = machinetime + dwelltime + index
        gross = (3600 / besttime).floor()
        net = (gross * 0.75).floor()
    elsif cutofftime > drilltime && cutofftime > turntime
        rev_type = "ERICA"
        rev = totalrevcutoff
        machinetime = rev * 60 / rpm
        dwelltime = 0.05 * machinetime
        besttime = machinetime + dwelltime + index
        gross = (3600 / besttime).floor()
        net = (gross * 0.75).floor()
    end

    clear_screen()
    puts

    puts " RPM .................................................: #{rpm}"
    puts " SURFACE SPEED .......................................: #{sfm}"
    puts " TOTAL REVOLUTION ....................................: #{rev}"
    puts " INDEX TIME ..........................................: #{index}"
    puts " SECONDS PER PIECE ...................................: #{besttime}"
    puts " GROSS PRODUCTION ....................................: #{gross}"
    puts " NET PRODUCTION ......................................: #{net}/75%"
    puts
    puts
    puts " CAM USES ON TURRET SPINDLE SHALL HAVE THE RISE OF ...: #{drilldepth}"
    puts " CAM USES ON CROSS SPINDLE SHALL HAVE THE RISE OF ....: #{turning}"
    puts " CAM USES ON CROSS SPINDLE FOR SHAVE TOOL.............: #{shave} (#{f})"
    puts " CAM USES ON CROSS SPINDLE FOR CUT OFF TOOL...........: #{cutoff} (#{ct})"

    drillfeed2 = drilldepth / rev
    turnfeed2 = turning / rev
    shavefeed2 = shave / rev
    cutofffeed2 = cutoff / rev

    puts
    puts " Actual feeds for drill, turning tools and cut-off using chosen revolution are:"
    puts
    puts " Drill's feed ............. : #{drillfeed2}"
    puts " Turn's feed .............. : #{turnfeed2}"
    puts " Shave-tool's feed ........ : #{shavefeed2}"
    puts " Cut-off's feed ........... : #{cutofffeed2}"


    saveToFile = prompt(" Do you want to save the information for printing? - (Y or N): ")
    if saveToFile == "Y" || saveToFile == "y"

        filename = "#{mat}_#{partnum}_#{day}.txt".gsub(/[\s\/]/, "_")
        File.open(filename, 'w') { |file|
            file.puts("Material ................... : #{mat}")
            file.puts("Part number ................ : #{partnum}")
            file.puts("Date ....................... : #{day}")
            file.puts
            file.puts("Bar diameter ............... : #{bar}")
            file.puts("Barrel diameter ............ : #{od}")
            file.puts("Inside diameter ............ : #{id}")
            file.puts("O.D. for cutoff ............ : #{odcutoff}")
            file.puts("Part's length .............. : #{partlength}")
            file.puts("Maximun width of form tool . : #{formwidth}")
            file.puts("Cutting insert's thickness . : #{thk}")
            file.puts("Drill's feed ............... : #{drillfeed}")
            file.puts("Turn's feed ................ : #{turnfeed}")
            file.puts("Cut-off's feed ............. : #{cutofffeed}")
            file.puts
            file.puts("DRILL TIME ................. : #{drilltime}")
            file.puts("TURN TIME .................. : #{turntime}")
            file.puts("CUT-OFF TIME ............... : #{cutofftime}")
            file.puts
            file.puts("TOTAL REVOLUTION FOR DRILL ........ : #{totalrevdrill}")
            file.puts("TOTAL REVOLUTION FOR FORM-TOOL .... : #{totalrevturn}")
            file.puts("TOTAL REVOLUTION FOR CUT-OFF ...... : #{totalrevcutoff}")
            file.puts
            file.puts("RPM .................................................: #{rpm}")
            file.puts("SURFACE SPEED .......................................: #{sfm}")
            file.puts("TOTAL REVOLUTION ....................................: #{rev}")
            file.puts("INDEX TIME ..........................................: #{index}")
            file.puts("SECONDS PER PIECE ...................................: #{besttime}")
            file.puts("GROSS PRODUCTION ....................................: #{gross}")
            file.puts("NET PRODUCTION ......................................: #{net}/75%")
            file.puts
            file.puts("CAM USES ON TURRET SPINDLE SHALL HAVE THE RISE OF ...: #{drilldepth}")
            file.puts("CAM USES ON CROSS SPINDLE SHALL HAVE THE RISE OF ....: #{turning}")
            file.puts("CAM USES ON CROSS SPINDLE FOR SHAVE TOOL.............: #{shave} (#{f})")
            file.puts("CAM USES ON CROSS SPINDLE FOR CUT OFF................: #{cutoff} (#{ct})")
            file.puts
            file.puts("Actual feeds for drill, turning tools and cut-off using chosen revolution are:")
            file.puts
            file.puts("Drill's feed ............. : #{drillfeed2}")
            file.puts("Turn's feed .............. : #{turnfeed2}")
            file.puts("Shave-tool's feed ........ : #{shavefeed2}")
            file.puts("Cut-off's feed ........... : #{cutofffeed2}")

        }
    end

    another = prompt(" Do you want to do a different part? - (Y or N): ")
    
    if another == "Y" || another == "y"
        main_menu()
    end
end

#
#  This actually starts the program by calling menu
#
main_menu()