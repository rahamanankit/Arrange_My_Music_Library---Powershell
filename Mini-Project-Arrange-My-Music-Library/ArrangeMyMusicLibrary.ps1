$source_path = "D:\Mini-Project-Arrange-My-Music-Library\Source"
$90s_Favorites_path = "D:\Mini-Project-Arrange-My-Music-Library\90s_Favourites"
$Childhood_Favorites_path = "D:\Mini-Project-Arrange-My-Music-Library\Childhood_Favourites"
$Current_Favorites_path = "D:\Mini-Project-Arrange-My-Music-Library\Current_Favourite"
$log_path = "D:\Mini-Project-Arrange-My-Music-Library\Arrange_My_Music_Library.log"
Write-Output "====================================================================" | Out-File $log_path
Write-Output "$(Get-Date)INFO : Script Execution is starting" | Out-File $log_path -Append
[array]$music_files = Get-ChildItem $file_path -Name
foreach($file in $music_files){
try{
$arr = $file -split "_"
if($arr.Count -gt 1){
Write-Output "$(Get-Date) INFO : File $file is in correct format" | Out-File $log_path -Append
Write-Output "$(Get-Date) INFO : Performing move operation on files" | Out-File $log_path -Append
$year = $arr[1].Substring(1,4)
    if([int]$year -lt 2000)
    {
        Move-Item -Path $file_path\$file -Destination $90s_Favorites_path
        Write-Output "$(Get-Date) INFO : Successfully moved file $file to $90s_Favorites_path" | Out-File $log_path -Append
    }
    elseif([int]$year -ge 2000 -and [int]$year -le 2010)
    {
        Move-Item -Path $file_path\$file -Destination $Childhood_Favorites_path
        Write-Output "$(Get-Date) INFO : Successfully moved file $file to $Childhood_Favorites_path" | Out-File $log_path -Append
    }
    elseif([int]$year -gt 2010)
    {
        Move-Item -Path $file_path\$file -Destination $Current_Favorites_path
        Write-Output "$(Get-Date) INFO : Successfully moved file $file to $Current_Favorites_path" | Out-File $log_path -Append
    }
 }
 else{
 Write-Output "$(Get-Date) WARNING : File $file is not in correct format. Cannot perform move operation" | Out-File $log_path -Append
 }
 }
 catch{
 $exception_message = $_.Exception.Message
 Write-Output "$(Get-Date) ERROR: An exception $exception_message has occured" | Out-File $log_path -Append
}
}
Write-Output "$(Get-Date) INFO : Script execution has completed successfully" | Out-File $log_path -Append
Write-Output "====================================================================" | Out-File $log_path -Append