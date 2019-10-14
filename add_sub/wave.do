onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider INPUT
add wave -noupdate /top_level_tb/DUT/DataA
add wave -noupdate /top_level_tb/DUT/DataB
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider DATA
add wave -noupdate -radix unsigned /top_level_tb/DUT/Rs
add wave -noupdate -radix unsigned /top_level_tb/DUT/Rt
add wave -noupdate -radix unsigned /top_level_tb/DUT/Rd
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider FLAGS
add wave -noupdate /top_level_tb/DUT/CLK
add wave -noupdate /top_level_tb/DUT/Zero
add wave -noupdate /top_level_tb/DUT/Carryout
add wave -noupdate /top_level_tb/DUT/Overflow
add wave -noupdate /top_level_tb/DUT/Write
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider MODE
add wave -noupdate /top_level_tb/DUT/ALUctr
add wave -noupdate /top_level_tb/DUT/RegWr
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider OUTPUT
add wave -noupdate /top_level_tb/DUT/Result
add wave -noupdate /top_level_tb/DUT/Buff
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {15 ns} 0}
configure wave -namecolwidth 210
configure wave -valuecolwidth 215
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {85 ns}
