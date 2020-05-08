setlocal

	set "_folder=validation\dadeniji"

	git add %_folder%\property.dadeniji.noValidation.ps1
	
	git add %_folder%\property.dadeniji.validation.ps1
	

	set "_folder=validation\KevinMarquette"

	git add %_folder%\property.KevinMarquette.ps1
		
	git add git*.cmd
	
endlocal