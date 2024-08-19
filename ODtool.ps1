function Show-ODImagingForm_psf {

	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35')

	[System.Windows.Forms.Application]::EnableVisualStyles()
	$ODToolForm = New-Object 'System.Windows.Forms.Form'
	$webbrowser1 = New-Object 'System.Windows.Forms.WebBrowser'
	$Outbox1 = New-Object 'System.Windows.Forms.TextBox'
	$tabcontrol1 = New-Object 'System.Windows.Forms.TabControl'
	$tabAOD = New-Object 'System.Windows.Forms.TabPage'
	$labelTools = New-Object 'System.Windows.Forms.Label'
	$buttonFDSReport = New-Object 'System.Windows.Forms.Button'
	$buttonAzure = New-Object 'System.Windows.Forms.Button'
	$labelBitlockerResource = New-Object 'System.Windows.Forms.Label'
	$buttonSAOne = New-Object 'System.Windows.Forms.Button'
	$labelNetworkLinks = New-Object 'System.Windows.Forms.Label'
	$labelInfo = New-Object 'System.Windows.Forms.Label'
	$labelTest = New-Object 'System.Windows.Forms.Label'
	$buttonMACFinder = New-Object 'System.Windows.Forms.Button'
	$buttonIPAM = New-Object 'System.Windows.Forms.Button'
	$buttonIntune = New-Object 'System.Windows.Forms.Button'
	$buttonPlaybook = New-Object 'System.Windows.Forms.Button'
	$buttonDeviceCheck = New-Object 'System.Windows.Forms.Button'
	$tabpagePreTest = New-Object 'System.Windows.Forms.TabPage'
	$buttonRDPPreTest = New-Object 'System.Windows.Forms.Button'
	$buttonLogoffPreTest = New-Object 'System.Windows.Forms.Button'
	$buttonFoldersPreTest = New-Object 'System.Windows.Forms.Button'
	$buttonSoftwarePreTest = New-Object 'System.Windows.Forms.Button'
	$buttonDrivesPreTest = New-Object 'System.Windows.Forms.Button'
	$buttonNICPreTest = New-Object 'System.Windows.Forms.Button'
	$buttonQueryPreTest = New-Object 'System.Windows.Forms.Button'
	$tabpageExam = New-Object 'System.Windows.Forms.TabPage'
	$buttonSoftwareExam = New-Object 'System.Windows.Forms.Button'
	$buttonRDPExam = New-Object 'System.Windows.Forms.Button'
	$buttonLogoffExam = New-Object 'System.Windows.Forms.Button'
	$buttonBaudExam = New-Object 'System.Windows.Forms.Button'
	$buttonDrivesExam = New-Object 'System.Windows.Forms.Button'
	$buttonNICExam = New-Object 'System.Windows.Forms.Button'
	$buttonQueryExam = New-Object 'System.Windows.Forms.Button'
	$labelSiteID = New-Object 'System.Windows.Forms.Label'
	$textboxSiteID = New-Object 'System.Windows.Forms.TextBox'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'

	$ODToolForm_Load={

		Set-ControlTheme $ODToolForm -Theme Dark
	}
	
	$darkToolStripMenuItem_Click={
		
		Set-ControlTheme -Control $ODToolForm -Theme Dark
	}
	
	function Set-ControlTheme
	{
		[CmdletBinding()]
		param
		(
			[Parameter(Mandatory = $true)]
			[ValidateNotNull()]
			[System.ComponentModel.Component]$Control,
			[ValidateSet('Light', 'Dark')]
			[string]$Theme = 'Dark',
			[System.Collections.Hashtable]$CustomColor
		)
		
		$Font = [System.Drawing.Font]::New('Segoe UI', 9)
		
		if ($Theme -eq 'Dark')
		{
			$WindowColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
			$ContainerColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
			$BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
			$ForeColor = [System.Drawing.Color]::White
			$BorderColor = [System.Drawing.Color]::DimGray
			$SelectionBackColor = [System.Drawing.SystemColors]::Highlight
			$SelectionForeColor = [System.Drawing.Color]::White
			$MenuSelectionColor = [System.Drawing.Color]::DimGray
		}
		else
		{
			$WindowColor = [System.Drawing.Color]::White
			$ContainerColor = [System.Drawing.Color]::WhiteSmoke
			$BackColor = [System.Drawing.Color]::Gainsboro
			$ForeColor = [System.Drawing.Color]::Black
			$BorderColor = [System.Drawing.Color]::DimGray
			$SelectionBackColor = [System.Drawing.SystemColors]::Highlight
			$SelectionForeColor = [System.Drawing.Color]::White
			$MenuSelectionColor = [System.Drawing.Color]::LightSteelBlue
		}
		
		if ($CustomColor)
		{

			$Color = $CustomColor.WindowColor -as [System.Drawing.Color]
			if ($Color) { $WindowColor = $Color }
			$Color = $CustomColor.ContainerColor -as [System.Drawing.Color]
			if ($Color) { $ContainerColor = $Color }
			$Color = $CustomColor.BackColor -as [System.Drawing.Color]
			if ($Color) { $BackColor = $Color }
			$Color = $CustomColor.ForeColor -as [System.Drawing.Color]
			if ($Color) { $ForeColor = $Color }
			$Color = $CustomColor.BorderColor -as [System.Drawing.Color]
			if ($Color) { $BorderColor = $Color }
			$Color = $CustomColor.SelectionBackColor -as [System.Drawing.Color]
			if ($Color) { $SelectionBackColor = $Color }
			$Color = $CustomColor.SelectionForeColor -as [System.Drawing.Color]
			if ($Color) { $SelectionForeColor = $Color }
			$Color = $CustomColor.MenuSelectionColor -as [System.Drawing.Color]
			if ($Color) { $MenuSelectionColor = $Color }
		}
		

		try
		{
			[ODToolTypes.ODToolColorTable] | Out-Null
		}
		catch
		{
			if ($PSVersionTable.PSVersion.Major -ge 7)
			{
				$Assemblies = 'System.Windows.Forms', 'System.Drawing', 'System.Drawing.Primitives'
			}
			else
			{
				$Assemblies = 'System.Windows.Forms', 'System.Drawing'
			}
			Add-Type -ReferencedAssemblies $Assemblies -TypeDefinition "
using System;
using System.Windows.Forms;
using System.Drawing;
namespace ODToolTypes
{
    public class ODToolColorTable : ProfessionalColorTable
    {
        Color ContainerBackColor;
        Color BackColor;
        Color BorderColor;
		Color SelectBackColor;

        public ODToolColorTable(Color containerColor, Color backColor, Color borderColor, Color selectBackColor)
        {
            ContainerBackColor = containerColor;
            BackColor = backColor;
            BorderColor = borderColor;
			SelectBackColor = selectBackColor;
        } 
		public override Color MenuStripGradientBegin { get { return ContainerBackColor; } }
        public override Color MenuStripGradientEnd { get { return ContainerBackColor; } }
        public override Color ToolStripBorder { get { return BorderColor; } }
        public override Color MenuItemBorder { get { return SelectBackColor; } }
        public override Color MenuItemSelected { get { return SelectBackColor; } }
        public override Color SeparatorDark { get { return BorderColor; } }
        public override Color ToolStripDropDownBackground { get { return BackColor; } }
        public override Color MenuBorder { get { return BorderColor; } }
        public override Color MenuItemSelectedGradientBegin { get { return SelectBackColor; } }
        public override Color MenuItemSelectedGradientEnd { get { return SelectBackColor; } }      
        public override Color MenuItemPressedGradientBegin { get { return ContainerBackColor; } }
        public override Color MenuItemPressedGradientEnd { get { return ContainerBackColor; } }
        public override Color MenuItemPressedGradientMiddle { get { return ContainerBackColor; } }
        public override Color ImageMarginGradientBegin { get { return BackColor; } }
        public override Color ImageMarginGradientEnd { get { return BackColor; } }
        public override Color ImageMarginGradientMiddle { get { return BackColor; } }
    }
}"
		}
	
		
		$colorTable = New-Object ODToolTypes.ODToolColorTable -ArgumentList $ContainerColor, $BackColor, $BorderColor, $MenuSelectionColor
		$render = New-Object System.Windows.Forms.ToolStripProfessionalRenderer -ArgumentList $colorTable
		[System.Windows.Forms.ToolStripManager]::Renderer = $render
		
	
		$Queue = New-Object System.Collections.Generic.Queue[System.ComponentModel.Component]
		$Queue.Enqueue($Control)
		
		Add-Type -AssemblyName System.Core
		

		$Processed = New-Object System.Collections.Generic.HashSet[System.ComponentModel.Component]
		

		while ($Queue.Count -gt 0)
		{
			$target = $Queue.Dequeue()
			
			if ($Processed.Contains($target)) { continue }
			$Processed.Add($target)
			
			$target.ForeColor = $ForeColor
			
		
			if ($target -is [System.Windows.Forms.Form])
			{
				$target.Font = $Font
				$target.BackColor = $ContainerColor
			}
			elseif ($target -is [System.Windows.Forms.SplitContainer])
			{
				$target.BackColor = $BorderColor
			}
			elseif ($target -is [System.Windows.Forms.PropertyGrid])
			{
				$target.BackColor = $BorderColor
				$target.ViewBackColor = $BackColor
				$target.ViewForeColor = $ForeColor
				$target.ViewBorderColor = $BorderColor
				$target.CategoryForeColor = $ForeColor
				$target.CategorySplitterColor = $ContainerColor
				$target.HelpBackColor = $BackColor
				$target.HelpForeColor = $ForeColor
				$target.HelpBorderColor = $BorderColor
				$target.CommandsBackColor = $BackColor
				$target.CommandsBorderColor = $BorderColor
				$target.CommandsForeColor = $ForeColor
				$target.LineColor = $ContainerColor
			}
			elseif ($target -is [System.Windows.Forms.ContainerControl] -or
				$target -is [System.Windows.Forms.Panel])
			{
			
				$target.BackColor = $ContainerColor
				
			}
			elseif ($target -is [System.Windows.Forms.GroupBox])
			{
				$target.FlatStyle = 'Flat'
			}
			elseif ($target -is [System.Windows.Forms.Button])
			{
				$target.FlatStyle = 'Flat'
				$target.FlatAppearance.BorderColor = $BorderColor
				$target.BackColor = $BackColor
			}
			elseif ($target -is [System.Windows.Forms.CheckBox] -or
				$target -is [System.Windows.Forms.RadioButton] -or
				$target -is [System.Windows.Forms.Label])
			{
			
			}
			elseif ($target -is [System.Windows.Forms.ComboBox])
			{
				$target.BackColor = $BackColor
				$target.FlatStyle = 'Flat'
			}
			elseif ($target -is [System.Windows.Forms.TextBox])
			{
				$target.BorderStyle = 'FixedSingle'
				$target.BackColor = $BackColor
			}
			elseif ($target -is [System.Windows.Forms.DataGridView])
			{
				$target.GridColor = $BorderColor
				$target.BackgroundColor = $ContainerColor
				$target.DefaultCellStyle.BackColor = $WindowColor
				$target.DefaultCellStyle.SelectionBackColor = $SelectionBackColor
				$target.DefaultCellStyle.SelectionForeColor = $SelectionForeColor
				$target.ColumnHeadersDefaultCellStyle.BackColor = $ContainerColor
				$target.ColumnHeadersDefaultCellStyle.ForeColor = $ForeColor
				$target.EnableHeadersVisualStyles = $false
				$target.ColumnHeadersBorderStyle = 'Single'
				$target.RowHeadersBorderStyle = 'Single'
				$target.RowHeadersDefaultCellStyle.BackColor = $ContainerColor
				$target.RowHeadersDefaultCellStyle.ForeColor = $ForeColor
				
			}
			elseif ($PSVersionTable.PSVersion.Major -le 5 -and $target -is [System.Windows.Forms.DataGrid])
			{
				$target.CaptionBackColor = $WindowColor
				$target.CaptionForeColor = $ForeColor
				$target.BackgroundColor = $ContainerColor
				$target.BackColor = $WindowColor
				$target.ForeColor = $ForeColor
				$target.HeaderBackColor = $ContainerColor
				$target.HeaderForeColor = $ForeColor
				$target.FlatMode = $true
				$target.BorderStyle = 'FixedSingle'
				$target.GridLineColor = $BorderColor
				$target.AlternatingBackColor = $ContainerColor
				$target.SelectionBackColor = $SelectionBackColor
				$target.SelectionForeColor = $SelectionForeColor
			}
			elseif ($target -is [System.Windows.Forms.ToolStrip])
			{
				
				$target.BackColor = $BackColor
				$target.Renderer = $render
				
				foreach ($item in $target.Items)
				{
					$Queue.Enqueue($item)
				}
			}
			elseif ($target -is [System.Windows.Forms.ToolStripMenuItem] -or
				$target -is [System.Windows.Forms.ToolStripDropDown] -or
				$target -is [System.Windows.Forms.ToolStripDropDownItem])
			{
				$target.BackColor = $BackColor
				foreach ($item in $target.DropDownItems)
				{
					$Queue.Enqueue($item)
				}
			}
			elseif ($target -is [System.Windows.Forms.ListBox] -or
				$target -is [System.Windows.Forms.ListView] -or
				$target -is [System.Windows.Forms.TreeView])
			{
				$target.BackColor = $WindowColor
			}
			else
			{
				$target.BackColor = $BackColor
			}
			
			
			if ($target -is [System.Windows.Forms.Control])
			{
				
				foreach ($child in $target.Controls)
				{
					$Queue.Enqueue($child)
				}
				if ($target.ContextMenuStrip)
				{
					$Queue.Enqueue($target.ContextMenuStrip);
				}
			}
		}
	}

	function Set-WebBrowserEmulation
	{
		param
		(
			[ValidateNotNullOrEmpty()]
			[string]
			$ExecutableName = [System.IO.Path]::GetFileName([System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName)
		)
		
		$valueNames = 'svcVersion', 'svcUpdateVersion', 'Version', 'W2kVersion'
		
		$version = 0;
		for ($i = 0; $i -lt $valueNames.Length; $i++)
		{
			$objVal = [Microsoft.Win32.Registry]::GetValue('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer', $valueNames[$i], '0')
			$strVal = [System.Convert]::ToString($objVal)
			if ($strVal)
			{
				$iPos = $strVal.IndexOf('.')
				if ($iPos -gt 0)
				{
					$strVal = $strVal.Substring(0, $iPos)
				}
				
				$res = 0;
				if ([int]::TryParse($strVal, [ref]$res))
				{
					$version = [Math]::Max($version, $res)
				}
			}
		}
		
		if ($version -lt 7)
		{
			$version = 7000
		}
		else
		{
			$version = $version * 1000
		}
		
		
		[Microsoft.Win32.Registry]::SetValue('HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', $ExecutableName, $version)
	}
	
	

	
	$buttonDeviceCheck_Click={
		$pingCount = 4
		$target = ($textboxSiteID.text)
		
			for ($i = 1; $i -le $pingCount; $i++) {
				$pingResult = Test-Connection -ComputerName $target -Count 1
				$Outbox1.AppendText("Ping to $($pingResult.Address) - Status: $($pingResult.StatusCode) - Time: $($pingResult.ResponseTime) ms" + [System.Environment]::NewLine)
				
				Start-Sleep -Seconds 1  
			}
	}
	
	$buttonPlaybook_Click={
		$commands = @('Get-Date', 'Get-Process', 'Get-Service')

			foreach ($command in $commands) {
				$result = & $command
				$outbox1.AppendText($result.ToString() + [System.Environment]::NewLine)
			}

		
	}
	
	$buttonIPAM_Click={
		while ($true) {
			$service = Get-Service -Name "W32Time"
			$Outbox1.AppendText("Service: $($service.Name) - Status: $($service.Status) - Time: $(Get-Date)" + [System.Environment]::NewLine)
			Start-Sleep -Seconds 5
		}
		
		
	}
	
	$buttonMACFinder_Click={
		try {
			
			Get-Item "C:\NonExistentFile.txt"
		} catch {
			$Outbox1.AppendText("Error: $($_.Exception.Message) at $(Get-Date)" + [System.Environment]::NewLine)
		}
		
	}
	
	$buttonSAOne_Click={
	
		$osInfo = Get-ComputerInfo | Select-Object -Property OsName, OsArchitecture, CsName, WindowsVersion, WindowsBuildLabEx
		$outbox1.AppendText("OS Name: $($osInfo.OsName)" + [System.Environment]::NewLine)
		$outbox1.AppendText("OS Architecture: $($osInfo.OsArchitecture)" + [System.Environment]::NewLine)
		$outbox1.AppendText("Computer Name: $($osInfo.CsName)" + [System.Environment]::NewLine)
		$outbox1.AppendText("Windows Version: $($osInfo.WindowsVersion)" + [System.Environment]::NewLine)
		$outbox1.AppendText("Windows Build: $($osInfo.WindowsBuildLabEx)" + [System.Environment]::NewLine)

	}
	
	$buttonIntune_Click={
		
		
	}
	
	$buttonAzure_Click={
		
		
	}
	
	$buttonFDSReport_Click={
		
		
	}
	
	$buttonQueryExam_Click={
		
		
	}
	
	$buttonNICExam_Click={
		
		
	}
	
	$buttonDrivesExam_Click={
		
		
	}
	
	$buttonBaudExam_Click={
		
		
	}
	
	$buttonLogoffExam_Click={
		
		
	}
	
	$buttonRDPExam_Click={
		
		
	}
	
	$buttonQueryPreTest_Click={
		
		
	}
	
	$buttonNICPreTest_Click={
		
		
	}
	
	$buttonDrivesPreTest_Click={
		
		$memInfo = Get-WmiObject -Class Win32_OperatingSystem
		$totalMem = [math]::round($memInfo.TotalVisibleMemorySize / 1MB, 2)
		$freeMem = [math]::round($memInfo.FreePhysicalMemory / 1MB, 2)
		$outbox1.AppendText("Total Memory: $totalMem GB - Free Memory: $freeMem GB" + [System.Environment]::NewLine)

	}
	
	$buttonFoldersPreTest_Click={
		
		
	}
	
	$buttonSoftwarePreTest_Click={
		
		$webbrowser1.Navigate("https://google.com")
	}
	
	$buttonLogoffPreTest_Click={
		
		$loggedUsers = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName
		$outbox1.AppendText("Logged-in User: $loggedUsers" + [System.Environment]::NewLine)

	}
	
	$buttonRDPPreTest_Click={
		
		$hostname = $rdpTextBox.Text.Trim()

		# Check if the hostname/IP is not empty
		if (-not [string]::IsNullOrEmpty($hostname)) {
			try {
				# Use mstsc.exe to open an RDP session
				Start-Process "mstsc.exe" -ArgumentList "/v:$hostname"
			} catch {
				[System.Windows.Forms.MessageBox]::Show("Failed to start RDP session. Please check the IP address or hostname.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
			}
		} else {
			[System.Windows.Forms.MessageBox]::Show("Please enter a valid IP address or hostname.", "Input Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
		}
	}
	
	$Outbox1_TextChanged={
		
		
	}
	
	$textboxSiteID_TextChanged={
		
		
	}
	
	$webbrowser1_DocumentCompleted=[System.Windows.Forms.WebBrowserDocumentCompletedEventHandler]{
	
		
		
	}
	

	
	$Form_StateCorrection_Load=
	{
		
		$ODToolForm.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		
		try
		{
			$webbrowser1.remove_DocumentCompleted($webbrowser1_DocumentCompleted)
			$Outbox1.remove_TextChanged($Outbox1_TextChanged)
			$buttonFDSReport.remove_Click($buttonFDSReport_Click)
			$buttonAzure.remove_Click($buttonAzure_Click)
			$buttonSAOne.remove_Click($buttonSAOne_Click)
			$buttonMACFinder.remove_Click($buttonMACFinder_Click)
			$buttonIPAM.remove_Click($buttonIPAM_Click)
			$buttonIntune.remove_Click($buttonIntune_Click)
			$buttonPlaybook.remove_Click($buttonPlaybook_Click)
			$buttonDeviceCheck.remove_Click($buttonDeviceCheck_Click)
			$buttonRDPPreTest.remove_Click($buttonRDPPreTest_Click)
			$buttonLogoffPreTest.remove_Click($buttonLogoffPreTest_Click)
			$buttonFoldersPreTest.remove_Click($buttonFoldersPreTest_Click)
			$buttonSoftwarePreTest.remove_Click($buttonSoftwarePreTest_Click)
			$buttonDrivesPreTest.remove_Click($buttonDrivesPreTest_Click)
			$buttonNICPreTest.remove_Click($buttonNICPreTest_Click)
			$buttonQueryPreTest.remove_Click($buttonQueryPreTest_Click)
			$buttonRDPExam.remove_Click($buttonRDPExam_Click)
			$buttonLogoffExam.remove_Click($buttonLogoffExam_Click)
			$buttonBaudExam.remove_Click($buttonBaudExam_Click)
			$buttonDrivesExam.remove_Click($buttonDrivesExam_Click)
			$buttonNICExam.remove_Click($buttonNICExam_Click)
			$buttonQueryExam.remove_Click($buttonQueryExam_Click)
			$textboxSiteID.remove_TextChanged($textboxSiteID_TextChanged)
			$ODToolForm.remove_Load($ODToolForm_Load)
			$ODToolForm.remove_Load($Form_StateCorrection_Load)
			$ODToolForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null  }
		$ODToolForm.Dispose()
		$textboxSiteID.Dispose()
		$labelSiteID.Dispose()
		$tabcontrol1.Dispose()
		$tabAOD.Dispose()
		$tabpagePreTest.Dispose()
		$tabpageExam.Dispose()
		$Outbox1.Dispose()
		$buttonDeviceCheck.Dispose()
		$buttonPlaybook.Dispose()
		$buttonIntune.Dispose()
		$buttonIPAM.Dispose()
		$buttonMACFinder.Dispose()
		$buttonQueryPreTest.Dispose()
		$buttonNICPreTest.Dispose()
		$buttonDrivesPreTest.Dispose()
		$buttonSoftwarePreTest.Dispose()
		$buttonFoldersPreTest.Dispose()
		$buttonLogoffPreTest.Dispose()
		$buttonRDPPreTest.Dispose()
		$buttonQueryExam.Dispose()
		$buttonNICExam.Dispose()
		$buttonDrivesExam.Dispose()
		$buttonBaudExam.Dispose()
		$buttonLogoffExam.Dispose()
		$buttonRDPExam.Dispose()
		$webbrowser1.Dispose()
		$labelTest.Dispose()
		$labelInfo.Dispose()
		$labelNetworkLinks.Dispose()
		$buttonSAOne.Dispose()
		$labelBitlockerResource.Dispose()
		$buttonAzure.Dispose()
		$buttonFDSReport.Dispose()
		$labelTools.Dispose()
		$buttonSoftwareExam.Dispose()
	}

	$ODToolForm.SuspendLayout()
	$tabcontrol1.SuspendLayout()
	$tabAOD.SuspendLayout()
	$tabpagePreTest.SuspendLayout()
	$tabpageExam.SuspendLayout()

	$ODToolForm.Controls.Add($webbrowser1)
	$ODToolForm.Controls.Add($Outbox1)
	$ODToolForm.Controls.Add($tabcontrol1)
	$ODToolForm.Controls.Add($labelSiteID)
	$ODToolForm.Controls.Add($textboxSiteID)
	$ODToolForm.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
	$ODToolForm.AutoScaleMode = 'Font'
	$ODToolForm.BackColor = [System.Drawing.SystemColors]::ControlDarkDark 
	$ODToolForm.ClientSize = New-Object System.Drawing.Size(1177, 559)
	$ODToolForm.FormBorderStyle = 'Fixed3D'
	$ODToolForm.MaximizeBox = $False
	$ODToolForm.MinimizeBox = $False
	$ODToolForm.Name = 'ODToolForm'
	$ODToolForm.ShowIcon = $False
	$ODToolForm.StartPosition = 'CenterScreen'
	$ODToolForm.Text = 'Form'
	$ODToolForm.add_Load($ODToolForm_Load)

	$webbrowser1.Location = New-Object System.Drawing.Point(608, 12)
	$webbrowser1.MinimumSize = New-Object System.Drawing.Size(20, 20)
	$webbrowser1.Name = 'webbrowser1'
	$webbrowser1.Size = New-Object System.Drawing.Size(546, 521)
	$webbrowser1.TabIndex = 19
	$webbrowser1.WebBrowserShortcutsEnabled = $False
	$webbrowser1.add_DocumentCompleted($webbrowser1_DocumentCompleted)

	$Outbox1.Font = [System.Drawing.Font]::new('Consolas', '8.25')
	$Outbox1.Location = New-Object System.Drawing.Point(12, 256)
	$Outbox1.Multiline = $True
	$Outbox1.Name = 'Outbox1'
	$Outbox1.ReadOnly = $True
	$Outbox1.RightToLeft = 'No'
	$Outbox1.ScrollBars = 'Vertical'
	$Outbox1.Size = New-Object System.Drawing.Size(590, 277)
	$Outbox1.TabIndex = 18
	$Outbox1.add_TextChanged($Outbox1_TextChanged)

	$tabcontrol1.Controls.Add($tabAOD)
	$tabcontrol1.Controls.Add($tabpagePreTest)
	$tabcontrol1.Controls.Add($tabpageExam)
	$tabcontrol1.Location = New-Object System.Drawing.Point(12, 55)
	$tabcontrol1.Name = 'tabcontrol1'
	$tabcontrol1.SelectedIndex = 0
	$tabcontrol1.Size = New-Object System.Drawing.Size(590, 195)
	$tabcontrol1.TabIndex = 17

	$tabAOD.Controls.Add($labelTools)
	$tabAOD.Controls.Add($buttonFDSReport)
	$tabAOD.Controls.Add($buttonAzure)
	$tabAOD.Controls.Add($labelBitlockerResource)
	$tabAOD.Controls.Add($buttonSAOne)
	$tabAOD.Controls.Add($labelNetworkLinks)
	$tabAOD.Controls.Add($labelInfo)
	$tabAOD.Controls.Add($labelTest)
	$tabAOD.Controls.Add($buttonMACFinder)
	$tabAOD.Controls.Add($buttonIPAM)
	$tabAOD.Controls.Add($buttonIntune)
	$tabAOD.Controls.Add($buttonPlaybook)
	$tabAOD.Controls.Add($buttonDeviceCheck)
	$tabAOD.BackColor = [System.Drawing.Color]::DarkGray 
	$tabAOD.ImeMode = 'NoControl'
	$tabAOD.Location = New-Object System.Drawing.Point(4, 22)
	$tabAOD.Name = 'tabAOD'
	$tabAOD.Padding = '3, 3, 3, 3'
	$tabAOD.Size = New-Object System.Drawing.Size(582, 169)
	$tabAOD.TabIndex = 0
	$tabAOD.Text = 'AOD'

	$labelTools.AutoSize = $True
	$labelTools.Location = New-Object System.Drawing.Point(450, 18)
	$labelTools.Name = 'labelTools'
	$labelTools.Size = New-Object System.Drawing.Size(33, 13)
	$labelTools.TabIndex = 14
	$labelTools.Text = 'Tools'

	$buttonFDSReport.Location = New-Object System.Drawing.Point(433, 46)
	$buttonFDSReport.Name = 'buttonFDSReport'
	$buttonFDSReport.Size = New-Object System.Drawing.Size(75, 23)
	$buttonFDSReport.TabIndex = 13
	$buttonFDSReport.Text = 'FDS Report'
	$buttonFDSReport.UseVisualStyleBackColor = $True
	$buttonFDSReport.add_Click($buttonFDSReport_Click)

	$buttonAzure.Cursor = 'Hand'
	$buttonAzure.Location = New-Object System.Drawing.Point(323, 75)
	$buttonAzure.Name = 'buttonAzure'
	$buttonAzure.Size = New-Object System.Drawing.Size(75, 23)
	$buttonAzure.TabIndex = 12
	$buttonAzure.Text = 'Azure'
	$buttonAzure.UseVisualStyleBackColor = $True
	$buttonAzure.add_Click($buttonAzure_Click)

	$labelBitlockerResource.AutoSize = $True
	$labelBitlockerResource.Location = New-Object System.Drawing.Point(314, 18)
	$labelBitlockerResource.Name = 'labelBitlockerResource'
	$labelBitlockerResource.Size = New-Object System.Drawing.Size(97, 13)
	$labelBitlockerResource.TabIndex = 11
	$labelBitlockerResource.Text = 'Bitlocker Resource'

	$buttonSAOne.Cursor = 'Hand'
	$buttonSAOne.Location = New-Object System.Drawing.Point(220, 104)
	$buttonSAOne.Name = 'buttonSAOne'
	$buttonSAOne.Size = New-Object System.Drawing.Size(75, 23)
	$buttonSAOne.TabIndex = 10
	$buttonSAOne.Text = 'SA One'
	$buttonSAOne.UseVisualStyleBackColor = $True
	$buttonSAOne.add_Click($buttonSAOne_Click)

	$labelNetworkLinks.AutoSize = $True
	$labelNetworkLinks.Location = New-Object System.Drawing.Point(220, 18)
	$labelNetworkLinks.Name = 'labelNetworkLinks'
	$labelNetworkLinks.Size = New-Object System.Drawing.Size(75, 13)
	$labelNetworkLinks.TabIndex = 9
	$labelNetworkLinks.Text = 'Network Links'

	$labelInfo.AutoSize = $True
	$labelInfo.Location = New-Object System.Drawing.Point(152, 18)
	$labelInfo.Name = 'labelInfo'
	$labelInfo.Size = New-Object System.Drawing.Size(25, 13)
	$labelInfo.TabIndex = 8
	$labelInfo.Text = 'Info'

	$labelTest.AutoSize = $True
	$labelTest.Location = New-Object System.Drawing.Point(37, 18)
	$labelTest.Name = 'labelTest'
	$labelTest.Size = New-Object System.Drawing.Size(28, 13)
	$labelTest.TabIndex = 7
	$labelTest.Text = 'Test'

	$buttonMACFinder.Cursor = 'Hand'
	$buttonMACFinder.Location = New-Object System.Drawing.Point(220, 75)
	$buttonMACFinder.Name = 'buttonMACFinder'
	$buttonMACFinder.Size = New-Object System.Drawing.Size(75, 23)
	$buttonMACFinder.TabIndex = 6
	$buttonMACFinder.Text = 'MAC Finder'
	$buttonMACFinder.UseVisualStyleBackColor = $True
	$buttonMACFinder.add_Click($buttonMACFinder_Click)

	$buttonIPAM.Cursor = 'Hand'
	$buttonIPAM.Location = New-Object System.Drawing.Point(220, 46)
	$buttonIPAM.Name = 'buttonIPAM'
	$buttonIPAM.Size = New-Object System.Drawing.Size(75, 23)
	$buttonIPAM.TabIndex = 5
	$buttonIPAM.Text = 'IPAM'
	$buttonIPAM.UseVisualStyleBackColor = $True
	$buttonIPAM.add_Click($buttonIPAM_Click)

	$buttonIntune.Cursor = 'Hand'
	$buttonIntune.Location = New-Object System.Drawing.Point(323, 46)
	$buttonIntune.Name = 'buttonIntune'
	$buttonIntune.Size = New-Object System.Drawing.Size(75, 23)
	$buttonIntune.TabIndex = 4
	$buttonIntune.Text = 'Intune'
	$buttonIntune.UseVisualStyleBackColor = $True
	$buttonIntune.add_Click($buttonIntune_Click)

	$buttonPlaybook.Cursor = 'Hand'
	$buttonPlaybook.Location = New-Object System.Drawing.Point(129, 46)
	$buttonPlaybook.Name = 'buttonPlaybook'
	$buttonPlaybook.Size = New-Object System.Drawing.Size(75, 23)
	$buttonPlaybook.TabIndex = 3
	$buttonPlaybook.Text = 'Playbook'
	$buttonPlaybook.UseVisualStyleBackColor = $True
	$buttonPlaybook.add_Click($buttonPlaybook_Click)

	$buttonDeviceCheck.Cursor = 'Hand'
	$buttonDeviceCheck.Location = New-Object System.Drawing.Point(18, 46)
	$buttonDeviceCheck.Name = 'buttonDeviceCheck'
	$buttonDeviceCheck.Size = New-Object System.Drawing.Size(89, 23)
	$buttonDeviceCheck.TabIndex = 0
	$buttonDeviceCheck.Text = 'Device Check'
	$buttonDeviceCheck.UseVisualStyleBackColor = $True
	$buttonDeviceCheck.add_Click($buttonDeviceCheck_Click)

	$tabpagePreTest.Controls.Add($buttonRDPPreTest)
	$tabpagePreTest.Controls.Add($buttonLogoffPreTest)
	$tabpagePreTest.Controls.Add($buttonFoldersPreTest)
	$tabpagePreTest.Controls.Add($buttonSoftwarePreTest)
	$tabpagePreTest.Controls.Add($buttonDrivesPreTest)
	$tabpagePreTest.Controls.Add($buttonNICPreTest)
	$tabpagePreTest.Controls.Add($buttonQueryPreTest)
	$tabpagePreTest.BackColor = [System.Drawing.Color]::DarkGray 
	$tabpagePreTest.Location = New-Object System.Drawing.Point(4, 22)
	$tabpagePreTest.Name = 'tabpagePreTest'
	$tabpagePreTest.Padding = '3, 3, 3, 3'
	$tabpagePreTest.Size = New-Object System.Drawing.Size(582, 169)
	$tabpagePreTest.TabIndex = 1
	$tabpagePreTest.Text = 'PreTest Room'

	$buttonRDPPreTest.Cursor = 'Hand'
	$buttonRDPPreTest.Location = New-Object System.Drawing.Point(261, 73)
	$buttonRDPPreTest.Name = 'buttonRDPPreTest'
	$buttonRDPPreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonRDPPreTest.TabIndex = 6
	$buttonRDPPreTest.Text = 'RDP'
	$buttonRDPPreTest.UseVisualStyleBackColor = $True
	$buttonRDPPreTest.add_Click($buttonRDPPreTest_Click)

	$buttonLogoffPreTest.Cursor = 'Hand'
	$buttonLogoffPreTest.Location = New-Object System.Drawing.Point(261, 44)
	$buttonLogoffPreTest.Name = 'buttonLogoffPreTest'
	$buttonLogoffPreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonLogoffPreTest.TabIndex = 5
	$buttonLogoffPreTest.Text = 'Logoff'
	$buttonLogoffPreTest.UseVisualStyleBackColor = $True
	$buttonLogoffPreTest.add_Click($buttonLogoffPreTest_Click)

	$buttonFoldersPreTest.Cursor = 'Hand'
	$buttonFoldersPreTest.Location = New-Object System.Drawing.Point(141, 44)
	$buttonFoldersPreTest.Name = 'buttonFoldersPreTest'
	$buttonFoldersPreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonFoldersPreTest.TabIndex = 4
	$buttonFoldersPreTest.Text = 'Folders'
	$buttonFoldersPreTest.UseVisualStyleBackColor = $True
	$buttonFoldersPreTest.add_Click($buttonFoldersPreTest_Click)

	$buttonSoftwarePreTest.Cursor = 'Hand'
	$buttonSoftwarePreTest.Location = New-Object System.Drawing.Point(141, 73)
	$buttonSoftwarePreTest.Name = 'buttonSoftwarePreTest'
	$buttonSoftwarePreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonSoftwarePreTest.TabIndex = 3
	$buttonSoftwarePreTest.Text = 'Software'
	$buttonSoftwarePreTest.UseVisualStyleBackColor = $True
	$buttonSoftwarePreTest.add_Click($buttonSoftwarePreTest_Click)

	$buttonDrivesPreTest.Cursor = 'Hand'
	$buttonDrivesPreTest.Location = New-Object System.Drawing.Point(36, 102)
	$buttonDrivesPreTest.Name = 'buttonDrivesPreTest'
	$buttonDrivesPreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonDrivesPreTest.TabIndex = 2
	$buttonDrivesPreTest.Text = 'Drives'
	$buttonDrivesPreTest.UseVisualStyleBackColor = $True
	$buttonDrivesPreTest.add_Click($buttonDrivesPreTest_Click)

	$buttonNICPreTest.Cursor = 'Hand'
	$buttonNICPreTest.Location = New-Object System.Drawing.Point(36, 73)
	$buttonNICPreTest.Name = 'buttonNICPreTest'
	$buttonNICPreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonNICPreTest.TabIndex = 1
	$buttonNICPreTest.Text = 'NIC'
	$buttonNICPreTest.UseVisualStyleBackColor = $True
	$buttonNICPreTest.add_Click($buttonNICPreTest_Click)

	$buttonQueryPreTest.Cursor = 'Hand'
	$buttonQueryPreTest.Location = New-Object System.Drawing.Point(36, 44)
	$buttonQueryPreTest.Name = 'buttonQueryPreTest'
	$buttonQueryPreTest.Size = New-Object System.Drawing.Size(75, 23)
	$buttonQueryPreTest.TabIndex = 0
	$buttonQueryPreTest.Text = 'Query'
	$buttonQueryPreTest.UseVisualStyleBackColor = $True
	$buttonQueryPreTest.add_Click($buttonQueryPreTest_Click)

	$tabpageExam.Controls.Add($buttonSoftwareExam)
	$tabpageExam.Controls.Add($buttonRDPExam)
	$tabpageExam.Controls.Add($buttonLogoffExam)
	$tabpageExam.Controls.Add($buttonBaudExam)
	$tabpageExam.Controls.Add($buttonDrivesExam)
	$tabpageExam.Controls.Add($buttonNICExam)
	$tabpageExam.Controls.Add($buttonQueryExam)
	$tabpageExam.BackColor = [System.Drawing.Color]::DarkGray 
	$tabpageExam.Location = New-Object System.Drawing.Point(4, 22)
	$tabpageExam.Name = 'tabpageExam'
	$tabpageExam.Padding = '3, 3, 3, 3'
	$tabpageExam.Size = New-Object System.Drawing.Size(582, 169)
	$tabpageExam.TabIndex = 2
	$tabpageExam.Text = 'Exam Room'

	$buttonSoftwareExam.Location = New-Object System.Drawing.Point(161, 70)
	$buttonSoftwareExam.Name = 'buttonSoftwareExam'
	$buttonSoftwareExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonSoftwareExam.TabIndex = 6
	$buttonSoftwareExam.Text = 'Software'
	$buttonSoftwareExam.UseVisualStyleBackColor = $True

	$buttonRDPExam.Cursor = 'Hand'
	$buttonRDPExam.Location = New-Object System.Drawing.Point(284, 70)
	$buttonRDPExam.Name = 'buttonRDPExam'
	$buttonRDPExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonRDPExam.TabIndex = 5
	$buttonRDPExam.Text = 'RDP'
	$buttonRDPExam.UseVisualStyleBackColor = $True
	$buttonRDPExam.add_Click($buttonRDPExam_Click)

	$buttonLogoffExam.Cursor = 'Hand'
	$buttonLogoffExam.Location = New-Object System.Drawing.Point(284, 41)
	$buttonLogoffExam.Name = 'buttonLogoffExam'
	$buttonLogoffExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonLogoffExam.TabIndex = 4
	$buttonLogoffExam.Text = 'Logoff'
	$buttonLogoffExam.UseVisualStyleBackColor = $True
	$buttonLogoffExam.add_Click($buttonLogoffExam_Click)

	$buttonBaudExam.Cursor = 'Hand'
	$buttonBaudExam.Location = New-Object System.Drawing.Point(161, 41)
	$buttonBaudExam.Name = 'buttonBaudExam'
	$buttonBaudExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonBaudExam.TabIndex = 3
	$buttonBaudExam.Text = 'Baud Rate'
	$buttonBaudExam.UseVisualStyleBackColor = $True
	$buttonBaudExam.add_Click($buttonBaudExam_Click)

	$buttonDrivesExam.Cursor = 'Hand'
	$buttonDrivesExam.Location = New-Object System.Drawing.Point(43, 99)
	$buttonDrivesExam.Name = 'buttonDrivesExam'
	$buttonDrivesExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonDrivesExam.TabIndex = 2
	$buttonDrivesExam.Text = 'Drives'
	$buttonDrivesExam.UseVisualStyleBackColor = $True
	$buttonDrivesExam.add_Click($buttonDrivesExam_Click)

	$buttonNICExam.Cursor = 'Hand'
	$buttonNICExam.Location = New-Object System.Drawing.Point(43, 70)
	$buttonNICExam.Name = 'buttonNICExam'
	$buttonNICExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonNICExam.TabIndex = 1
	$buttonNICExam.Text = 'NIC'
	$buttonNICExam.UseVisualStyleBackColor = $True
	$buttonNICExam.add_Click($buttonNICExam_Click)

	$buttonQueryExam.Cursor = 'Hand'
	$buttonQueryExam.Location = New-Object System.Drawing.Point(43, 41)
	$buttonQueryExam.Name = 'buttonQueryExam'
	$buttonQueryExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonQueryExam.TabIndex = 0
	$buttonQueryExam.Text = 'Query'
	$buttonQueryExam.UseVisualStyleBackColor = $True
	$buttonQueryExam.add_Click($buttonQueryExam_Click)

	$labelSiteID.AutoSize = $True
	$labelSiteID.Location = New-Object System.Drawing.Point(34, 23)
	$labelSiteID.Name = 'labelSiteID'
	$labelSiteID.Size = New-Object System.Drawing.Size(42, 13)
	$labelSiteID.TabIndex = 16
	$labelSiteID.Text = 'Site ID:'

	$textboxSiteID.Location = New-Object System.Drawing.Point(96, 20)
	$textboxSiteID.Name = 'textboxSiteID'
	$textboxSiteID.Size = New-Object System.Drawing.Size(100, 20)
	$textboxSiteID.TabIndex = 15
	$textboxSiteID.add_TextChanged($textboxSiteID_TextChanged)
	$tabpageExam.ResumeLayout()
	$tabpagePreTest.ResumeLayout()
	$tabAOD.ResumeLayout()
	$tabcontrol1.ResumeLayout()
	$ODToolForm.ResumeLayout()

	$InitialFormWindowState = $ODToolForm.WindowState

	$ODToolForm.add_Load($Form_StateCorrection_Load)

	$ODToolForm.add_FormClosed($Form_Cleanup_FormClosed)

	return $ODToolForm.ShowDialog()

} 

Show-ODImagingForm_psf | Out-Null
