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

function hasPropertyIn([object] $object, [string] $property )
{
	
	<#
		Declare Variables
	#>
	[Boolean] $hasProperty = $false;
	[string]  $functionName = "";
	[string]  $log = "";
	
	<#
		Get Function Name
	#>
	if ( $null -ne $MyInvocation )
	{
		
		if ( $null -ne $MyInvocation.MyCommand )
		{
	
			$functionName = $MyInvocation.MyCommand
			
		}
		
	}
	
	<#
		$object Nullability Check
	#>
	if ($null -eq $object )
	{
			
		$log = "In function {0}, `$object is null" -f $functionName;
		
		throw $log;
		
		return $bHasProperty;
		
	}

	<#
		$property Nullability Check
	#>	
	if ($null -eq $property )
	{
			
		$log = "In function {0}, `$property is null" -f $property;
		
		throw $log;
		
		return $bHasProperty;
		
	}

	<#
		Is property in object.PSObject.Properties.Name list
	#>
    $hasProperty = $property -in $object.PSobject.Properties.Name;

	<#
		Return HasProperty
	#>
    return($hasProperty);

	
}

function hasPropertyMatch($object, $propertyName)
{

	<#
		Declare Variables
	#>
	[Boolean] $hasProperty = $false;
	[string]  $functionName = "";
	[string]  $log = "";
	
	<#
		Get Function Name
	#>
	if ( $null -ne $MyInvocation )
	{
		
		if ( $null -ne $MyInvocation.MyCommand )
		{
	
			$functionName = $MyInvocation.MyCommand
			
		}
		
	}
	
	<#
		$object Nullability Check
	#>
	if ($null -eq $object )
	{
			
		$log = "In function {0}, `$object is null" -f $functionName;
		
		throw $log;
		
		return $bHasProperty;
		
	}

	<#
		$property Nullability Check
	#>	
	if ($null -eq $property )
	{
			
		$log = "In function {0}, `$property is null" -f $property;
		
		throw $log;
		
		return $bHasProperty;
		
	}


        $hasProperty = ( $object.psobject.properties.match($propertyName) )
    
        return($hasProperty);
	
}

<#
	Instantiate a few objects
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
