Set-StrictMode -Version 2.0

# initialize the array
[PsObject[]]$objCandidate = @()

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

$objCandidate += $objHuman1;
$objCandidate += $objHuman2;
$objCandidate += $objHuman3;

foreach($person in $objCandidate) {

    Write-Host "`tName:- '$($person.Name)'";

    Write-Host "`tGender:- '$($person.gender)'";

    Write-Host "`tNationality: '$($person.nationality)'";
    
    Write-Host "";

}