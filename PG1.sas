data suv_upto_30000;
	set sashelp.cars;
	where type = "SUV" and msrp <= 30000;a
run;

/*uzycie formatow*/
data class_bd;
	set pg1.class_birthdate;
	format Birthdate ddmmyyd10.;
	where Birthdate >= "01sep2005"d;
run;

/*Sortowanie danych*/
proc sort data=Class_bd out=class_bd_srt;
	by Birthdate;
run;

/*Sortowanie rosnaco po wieku i rosnaco po wzroscie*/
proc sort data=Class_bd out=class_bd_srt;
	by age Height;
run;

/*Sortowanie rosnaco po wieku i malejaco po wzroscie*/
proc sort data=Class_bd out=class_bd_srt;
	by age descending Height;
run;

/*Usuwanie duplikatow*/
proc sort data=pg1.class_test3 out=class_test3_clean nodupkey dupout=class_test3_dups;
/*	by name subject testscore;*/
	by _all_;
run;

/*Zadanie*/
proc sort data=pg1.eu_occ (KEEP=Geo Country) out=countrylist nodupkey; 
	by Geo Country;
run;

/*Przetwarzanie danych w data step*/
data class_bd;
	set pg1.class_birthdate;
	format Birthdate ddmmyyd10.;
	where Birthdate >= "01sep2005"d;
	drop age;
run;

/*Drop jako opcja zbioru*/
data class_bd;
	set pg1.class_birthdate(drop=age);
	format Birthdate ddmmyyd10.;
	where Birthdate >= "01sep2005"d;
run;