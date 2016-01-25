* CMOS Inverter
* 
* parameters and models 
*---------------------------------------------------------
.lib './models25.txt' TT
.temp 25
.param SUPP = 2.5 

* netlist 
*---------------------------------------------------------
* inverter
*  drn gt src bdy type width   length
M1 OUT IN gnd gnd nmos w=0.72u l=0.24u
M2 OUT IN VDD VDD pmos w=0.72u l=0.24u

Cl OUT gnd 50f

* sources
Vvdd VDD gnd 'SUPP' 
Vin IN gnd PULSE( 0 2.5 0ps 100ps 100ps 300ps 800ps )

* stimulus 
*---------------------------------------------------------
.tran 1ps 8ns
* propogation delay
.measure tran tpr 
+	trig v(IN) val='SUPP/2' fall=1 
+	targ v(OUT) val='SUPP/2' rise=1 
.measure tran tpf 
+	trig v(IN) val='SUPP/2' rise=1  
+	targ v(OUT) val='SUPP/2' fall=1 
.measure prop_delay param='(tpr + tpf)/2'

* vary temperature and supply 
.alter case 1: 27C temp, 2.8V supply
.param SUPP = 2.8
.temp 27

.alter case 2: 50C temp, 2.5V supply
.param SUPP = 2.5
.temp 50

.alter case 1: -50C temp, 2.2V supply
.param SUPP = 2.2
.temp -50

.option post
.end


