Set-StrictMode -Version 2.0

[string]  $propertyNationality = "nationality";
[boolean] $skipPropertyCheck=$false;

# initialize the array
[PsObject[]]$objCandidate = @()

$skipPropertyCheck = $true;


<#
    How can you test if an object has a specific property?
    https://stackoverflow.com/questions/26997511/how-can-you-test-if-an-object-has-a-specific-property
    Answered by dan-gph
#>
function hasPropertyIn($object, $propertyName)
{
    $hasProperty = $propertyName -in $object.PSobject.Properties.Name;
    
    return($hasProperty);
}

function hasPropertyMatch($object, $propertyName)
{
    $hasProperty = ( $object.psobject.properties.match($propertyName) )
    
    return($hasProperty);
}

<#
	Instanciate a few objects
#>
$objHuman1 = [pscustomobject]@{
    name='L.L. Cool J';
    gender='M';
    nationality='American';
}

$objHuman2 = [pscustomobject]@{
    name='Fresh Prince';
    gender='M';
    nationality='American';

}

$objHuman3 = [pscustomobject]@{
    name='Slick Rick';
    gender='M';
}

<#
	Add Objects to list
#>
$objCandidate += $objHuman1;
$objCandidate += $objHuman2;
$objCandidate += $objHuman3;

foreach($person in $objCandidate) {

    # Does object have property 
    $propNationalityExists = hasPropertyIn $person $propertyNationality;

	<#
		Does object have property - match
		$propNationalityExists = hasPropertyMatch  $person $propertyNationality;
	#>

    Write-Host "`tName:- '$($person.Name)'";

    Write-Host "`tGender:- '$($person.gender)'";

    if ( $propNationalityExists -eq $True )
    {
    
        Write-Host "`tNationality: '$($person.nationality)'";
    }
    
    Write-Host "";

}