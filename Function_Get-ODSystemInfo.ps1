function Get-ODSystemInfo {
    <#
    .SYNOPSIS
    Queries Windows Device(s) pulling their information needed for Identifying and Monitoring.

    .DESCRIPTION
    Queries the OS and CS classes within WMI. Must run as administrator for the function to operate properly.

    .PARAMETER Computername
    The DNS name of the computer/device you wish to query.

    .PARAMETER ShowProgress
    Shows a progress bar of current operations and percantage completed.
    Percentages will be inaccurate.

    .PARAMETER IPAddress
    The IP Address of the computer/device you wish to query.

    .PARAMETER ErrorLogFilePath
    Saving to the C:\TEMP directory under the text file ODSysInfoLog.

    .EXAMPLE
    get-ODSystemInfo -computername localhost, localhost
    Queries the computer by the hostname or DNS Name in a list.
    
    .EXAMPLE
    get-ODSystemInfo -IPAddress 127.0.0.1, 127.0.0.1
    Queries the computer by the IP Address in a list.
    
    .EXAMPLE
    get-ODSystemInfo -computername localhost, localhost -ShowProgress
    Will display a status bar with the progress of the function.
    #>
    param(
        [Parameter(Mandatory=$True,
                   ValueFromPipeline=$True,
                   ValueFromPipelineByPropertyName=$True,
                   ParameterSetName='computername',
                   HelpMessage="Computer name to query via WMI")]
        [Alias('hostname')]
        [ValidateLength(9,16)]
        [string[]]$computername,
        [Parameter( Mandatory=$True,
                    ParameterSetName='ip',
                    HelpMessage="IP address to query via WMI")]
        [ValidatePattern('\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')]
        [String[]]$IPAddress,

        [Parameter()]
        [string]$ErroLogFilePath = 'c:\ODsysinfolog.txt',
        [switch]$ShowProgress
    )
   BEGIN {
        if ($PSBoundParameters.ContainsKey('IPAddress')) {
            write-verbose "Putting IP addresses into variable"
            $computername = $IPAddress
        }
        $each_computer = (100/($computername.count) -as [int])
        $current_complete = 0
        $ErrorLogCreated = Test-Path $ErroLogFilePath
        if($ErroLogCreated -eq $False){
            new-item -path 'c:\' -Name "ODSysteminfolog" -ItemType txt
        }
   }
   PROCESS {
        foreach ($computer in $computername) {
            if($ShowProgress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Begining to Query via WMI" -PercentComplete $current_complete}            
            Try{
                $ConnectivityTest=$True
                if($ShowProgress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Operating System" -PercentComplete $current_complete}
                $os = Get-WmiObject -Class Win32_operatingsystem -ComputerName $computer -ErrorAction Stop
            } catch{
                Write-warning "Unable to connect to $computer's WMI. Please Verify the device is powered on or if the device name is valid. Logged into Error Log in C:\temp"
                $ConnectivityTest=$False
                if($ShowProgress) { Write-Progress -Activity "Failed on $computer" -CurrentOperation "Failed to Connect" -Completed
                $computer | Out-File $ErroLogFilePath -Append
            }}
            if($ConnectivityTest) {
                    if($ShowProgress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Computer System" -PercentComplete $current_complete}
                $cs = Get-WmiObject -Class Win32_computersystem -ComputerName $computer
                
                    if($ShowProgress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Network Adapter" -PercentComplete $current_complete}
                
                
                    if($ShowProgress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Creating Object along with it's properties" -PercentComplete $current_complete}
                    $props = [ordered]@{
                            'computername' = $computer;
                            'Users' = $os.NumberOfUsers;
                            'OS status'= $os.Status;
                            'Macs'= $nt.macaddress;
                            'Device Make' = $cs.manufacturer
                            }
                $obj = New-Object -TypeName psobject -Property $props
                $obj.PSObject.TypeNames.Insert(0,'OD.Systeminfo')

                write-verbose = "Getting local disk information"
                $drives = Get-WmiObject -Class win32_logicaldisk -filter "DriveType=3" -ComputerName $computer
                foreach($drive in $drives){
                    $driveprops = [ordered] @{
                                             'Drive'=$drive.deviceid;
                                             'FreeSpace'=$drive.freespace;
                                             'Size'=$drive.size;
                                                }
                    $driveobj = new-object -TypeName psobject -Property $driveprops
                    $children += $driveobj
                }
                Write-Verbose = "Applying the child properties for the local disk to the object"
                $obj | Add-Member -MemberType NoteProperty -Name 'LocalDrives' -value $children
                $children = @()
                Write-Verbose = "Grabbing network adapter via wmi"
               $nics = Get-WmiObject -Class Win32_NetworkAdapter -ComputerName $computer -Filter "physicaladapter=$true"
                foreach($nic in $nics){
                    $nicprops = [ordered] @{
                                             'MAC'=$nic.MACAddress;
                                             'Device ID'=$nic.DeviceID;
                                             'Speed'= $nic.Speed;
                                             'AdapterType'=$nic.AdapterType
                                                }
                    $nicobj = new-object -TypeName psobject -Property $nicprops
                    $children += $nicobj
                }
                Write-Verbose = "Applying the child properties of the network adapters to the object"
                $obj | Add-Member -MemberType NoteProperty -Name 'NetworkAdapters' -value $children
                write-output $obj
                    if($ShowProgress) { Write-Progress -Activity "Working on $computer" -CurrentOperation "Writing object and its properties to output" -PercentComplete $current_complete}
                
            }
        }
   }
   END{
    if($ShowProgress) { Write-Progress -Activity "Done on $computer" -CurrentOperation "Done" -Completed }
   }
}

