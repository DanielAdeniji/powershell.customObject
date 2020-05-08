<#
	https://powershellexplained.com/2016-10-28-powershell-everything-you-wanted-to-know-about-pscustomobject/
#>
Set-StrictMode -Version 2.0

[string] $lineBreak= "=" * 65;

[string] $propertyID = "id";
[string] $propertyLanguage = "Language";

[string] $formatPropertyCheck = "Check Type - {0} - In object {1}, property {2} is present {3}";

[boolean] $bPropertyCheckMatchPropertyID = $false;

$myHashtable = @{
    Name     = 'Kevin'
    Language = 'Powershell'
    State    = 'Texas'
}

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

	[Boolean] $found = $false;
	
	foreach ($propName in $object.PSobject.Properties.Name)
	{ 
	
		if ($propName -like $propertyName)
		{
		
			$found=$true;
			
			break;
		}
		
	}
	
	return($found);
	
}

$myObject = New-Object -TypeName PSObject -Property $myHashtable;


write-Host "";
write-Host "";

$log = "Get-Member -MemberType NoteProperty | Select -ExpandProperty Name";

Write-Host $log;

Write-Host $lineBreak;

$myObject | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name;

write-Host "";
write-Host "";

Write-Host $lineBreak;

$log = "psobject.properties.name";

Write-Host $log;

Write-Host $lineBreak;

$myobject.psobject.properties.name;

write-Host "";
write-Host "";

$bPropertyCheckMatch = $myobject.psobject.properties.match($propertyID);

$log = $formatPropertyCheck -f "match", "myobject", $propertyID, $bPropertyCheckMatch;

Write-Host $log;
write-Host "";

$bPropertyCheckMatchPropertyID = hasPropertyMatch $myobject $propertyID;

$log = $formatPropertyCheck -f "list match", "myobject", $propertyID, $bPropertyCheckMatchPropertyID;

Write-Host $log;
write-Host "";


$bPropertyCheckHasPropertyID = hasPropertyIn $myobject $propertyID;

$log = $formatPropertyCheck -f "in", "myobject", $propertyID, $bPropertyCheckHasPropertyID;

Write-Host $log;
write-Host "";

$bPropertyCheckHasPropertyLanguage = hasPropertyIn $myobject $propertyLanguage;

$log = $formatPropertyCheck -f "in", "myobject", $propertyLanguage, $bPropertyCheckHasPropertyLanguage;

Write-Host $log;
write-Host "";


$bPropertyCheckMatchPropertyLanguage = hasPropertyMatch $myobject $propertyLanguage;

$log = $formatPropertyCheck -f "list match", "myobject", $propertyLanguage, $bPropertyCheckMatchPropertyLanguage;

Write-Host $log;
write-Host "";
