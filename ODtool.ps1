#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: dff35613-48ac-4c81-ab2f-a4f7be0e92ae
# Source File: C:\Users\Galex\OneDrive\Documents\!Personal\Projects\ODApp\MainForm.psf
#------------------------------------------------------------------------

<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2024 v5.8.242 (L)
     Generated on:       8/2/2024 3:31 PM
     Generated by:       Galex
    --------------------------------------------------------------------------------
    .DESCRIPTION
        GUI script generated by PowerShell Studio 2024
#>


#----------------------------------------------
#region Application Functions
#----------------------------------------------

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-MainForm_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$MainForm = New-Object 'System.Windows.Forms.Form'
	$richtextbox1 = New-Object 'System.Windows.Forms.RichTextBox'
	$Tabs = New-Object 'System.Windows.Forms.TabControl'
	$General = New-Object 'System.Windows.Forms.TabPage'
	$labelLinks = New-Object 'System.Windows.Forms.Label'
	$labelInfo = New-Object 'System.Windows.Forms.Label'
	$labelTest = New-Object 'System.Windows.Forms.Label'
	$buttonPlaybook = New-Object 'System.Windows.Forms.Button'
	$buttonMacFinder = New-Object 'System.Windows.Forms.Button'
	$buttonSAOne = New-Object 'System.Windows.Forms.Button'
	$buttonTestInstall = New-Object 'System.Windows.Forms.Button'
	$buttonPing = New-Object 'System.Windows.Forms.Button'
	$Pretest = New-Object 'System.Windows.Forms.TabPage'
	$buttonSoftware = New-Object 'System.Windows.Forms.Button'
	$buttonDrives = New-Object 'System.Windows.Forms.Button'
	$buttonNIC = New-Object 'System.Windows.Forms.Button'
	$buttonQuery = New-Object 'System.Windows.Forms.Button'
	$buttonRDP = New-Object 'System.Windows.Forms.Button'
	$buttonLogoff = New-Object 'System.Windows.Forms.Button'
	$buttonFolders = New-Object 'System.Windows.Forms.Button'
	$buttonPingOD = New-Object 'System.Windows.Forms.Button'
	$Exam = New-Object 'System.Windows.Forms.TabPage'
	$buttonSoftwareExam = New-Object 'System.Windows.Forms.Button'
	$buttonDrivesExam = New-Object 'System.Windows.Forms.Button'
	$buttonNICExam = New-Object 'System.Windows.Forms.Button'
	$buttonQueryExam = New-Object 'System.Windows.Forms.Button'
	$buttonLogoffExam = New-Object 'System.Windows.Forms.Button'
	$buttonRDPExam = New-Object 'System.Windows.Forms.Button'
	$buttonComExam = New-Object 'System.Windows.Forms.Button'
	$SiteNumber = New-Object 'System.Windows.Forms.TextBox'
	$labelWorkstation = New-Object 'System.Windows.Forms.Label'
	$labelSiteNo = New-Object 'System.Windows.Forms.Label'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$MainForm_Load={
	#TODO: Initialize Form Controls here
	
	}
	
	$buttonCallChildForm_Click={
		#TODO: Place custom script here
		if((Show-ChildForm_psf) -eq 'OK')
		{
			
		}
	}
	
	$buttonTestInstall_Click={
		#TODO: Place custom script here
		
	}
	
	$buttonODPlaybook_Click={
		#TODO: Place custom script here
		
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$MainForm.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$MainForm.remove_Load($MainForm_Load)
			$MainForm.remove_Load($Form_StateCorrection_Load)
			$MainForm.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
		$MainForm.Dispose()
		$SiteNumber.Dispose()
		$labelWorkstation.Dispose()
		$labelSiteNo.Dispose()
		$richtextbox1.Dispose()
		$Exam.Dispose()
		$buttonComExam.Dispose()
		$buttonRDPExam.Dispose()
		$buttonLogoffExam.Dispose()
		$buttonQueryExam.Dispose()
		$buttonNICExam.Dispose()
		$buttonDrivesExam.Dispose()
		$buttonSoftwareExam.Dispose()
		$Pretest.Dispose()
		$buttonPingOD.Dispose()
		$buttonFolders.Dispose()
		$buttonLogoff.Dispose()
		$buttonRDP.Dispose()
		$buttonQuery.Dispose()
		$buttonNIC.Dispose()
		$buttonDrives.Dispose()
		$buttonSoftware.Dispose()
		$General.Dispose()
		$buttonPing.Dispose()
		$buttonTestInstall.Dispose()
		$buttonSAOne.Dispose()
		$buttonMacFinder.Dispose()
		$buttonPlaybook.Dispose()
		$labelTest.Dispose()
		$labelInfo.Dispose()
		$labelLinks.Dispose()
		$Tabs.Dispose()
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$MainForm.SuspendLayout()
	$Exam.SuspendLayout()
	$Pretest.SuspendLayout()
	$General.SuspendLayout()
	$Tabs.SuspendLayout()
	#
	# MainForm
	#
	$MainForm.Controls.Add($richtextbox1)
	$MainForm.Controls.Add($Tabs)
	$MainForm.Controls.Add($SiteNumber)
	$MainForm.Controls.Add($labelWorkstation)
	$MainForm.Controls.Add($labelSiteNo)
	$MainForm.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
	$MainForm.AutoScaleMode = 'Font'
	$MainForm.AutoScroll = $True
	$MainForm.BackgroundImageLayout = 'None'
	$MainForm.ClientSize = New-Object System.Drawing.Size(378, 464)
	$MainForm.Cursor = 'WaitCursor'
	$MainForm.FormBorderStyle = 'FixedSingle'
	$MainForm.Margin = '4, 4, 4, 4'
	$MainForm.MaximizeBox = $False
	$MainForm.MinimizeBox = $False
	$MainForm.MinimumSize = New-Object System.Drawing.Size(394, 503)
	$MainForm.Name = 'MainForm'
	$MainForm.RightToLeft = 'No'
	$MainForm.ShowIcon = $False
	$MainForm.StartPosition = 'CenterScreen'
	$MainForm.Text = 'OD Imaging Tool'
	$MainForm.UseWaitCursor = $True
	$MainForm.add_Load($MainForm_Load)
	#
	# richtextbox1
	#
	$richtextbox1.Location = New-Object System.Drawing.Point(14, 217)
	$richtextbox1.Name = 'richtextbox1'
	$richtextbox1.ReadOnly = $True
	$richtextbox1.Size = New-Object System.Drawing.Size(352, 235)
	$richtextbox1.TabIndex = 7
	$richtextbox1.Text = ''
	#
	# Tabs
	#
	$Tabs.Controls.Add($General)
	$Tabs.Controls.Add($Pretest)
	$Tabs.Controls.Add($Exam)
	$Tabs.Cursor = 'Hand'
	$Tabs.Location = New-Object System.Drawing.Point(85, 66)
	$Tabs.Name = 'Tabs'
	$Tabs.SelectedIndex = 0
	$Tabs.Size = New-Object System.Drawing.Size(285, 133)
	$Tabs.SizeMode = 'FillToRight'
	$Tabs.TabIndex = 6
	#
	# General
	#
	$General.Controls.Add($labelLinks)
	$General.Controls.Add($labelInfo)
	$General.Controls.Add($labelTest)
	$General.Controls.Add($buttonPlaybook)
	$General.Controls.Add($buttonMacFinder)
	$General.Controls.Add($buttonSAOne)
	$General.Controls.Add($buttonTestInstall)
	$General.Controls.Add($buttonPing)
	$General.Location = New-Object System.Drawing.Point(4, 22)
	$General.Name = 'General'
	$General.Padding = '3, 3, 3, 3'
	$General.Size = New-Object System.Drawing.Size(277, 107)
	$General.TabIndex = 0
	$General.Text = 'General'
	$General.UseVisualStyleBackColor = $True
	#
	# labelLinks
	#
	$labelLinks.AutoSize = $True
	$labelLinks.Location = New-Object System.Drawing.Point(200, 5)
	$labelLinks.Name = 'labelLinks'
	$labelLinks.Size = New-Object System.Drawing.Size(32, 13)
	$labelLinks.TabIndex = 15
	$labelLinks.Text = 'Links'
	#
	# labelInfo
	#
	$labelInfo.AutoSize = $True
	$labelInfo.Location = New-Object System.Drawing.Point(112, 3)
	$labelInfo.Name = 'labelInfo'
	$labelInfo.Size = New-Object System.Drawing.Size(25, 13)
	$labelInfo.TabIndex = 14
	$labelInfo.Text = 'Info'
	#
	# labelTest
	#
	$labelTest.AutoSize = $True
	$labelTest.Location = New-Object System.Drawing.Point(24, 5)
	$labelTest.Name = 'labelTest'
	$labelTest.Size = New-Object System.Drawing.Size(28, 13)
	$labelTest.TabIndex = 13
	$labelTest.Text = 'Test'
	#
	# buttonPlaybook
	#
	$buttonPlaybook.Location = New-Object System.Drawing.Point(87, 21)
	$buttonPlaybook.Name = 'buttonPlaybook'
	$buttonPlaybook.Size = New-Object System.Drawing.Size(75, 23)
	$buttonPlaybook.TabIndex = 12
	$buttonPlaybook.Text = 'Playbook'
	$buttonPlaybook.UseVisualStyleBackColor = $True
	#
	# buttonMacFinder
	#
	$buttonMacFinder.Location = New-Object System.Drawing.Point(179, 50)
	$buttonMacFinder.Name = 'buttonMacFinder'
	$buttonMacFinder.Size = New-Object System.Drawing.Size(75, 23)
	$buttonMacFinder.TabIndex = 11
	$buttonMacFinder.Text = 'Mac Finder'
	$buttonMacFinder.UseVisualStyleBackColor = $True
	#
	# buttonSAOne
	#
	$buttonSAOne.Location = New-Object System.Drawing.Point(179, 79)
	$buttonSAOne.Name = 'buttonSAOne'
	$buttonSAOne.Size = New-Object System.Drawing.Size(75, 23)
	$buttonSAOne.TabIndex = 10
	$buttonSAOne.Text = 'SA One'
	$buttonSAOne.UseVisualStyleBackColor = $True
	#
	# buttonTestInstall
	#
	$buttonTestInstall.Location = New-Object System.Drawing.Point(179, 21)
	$buttonTestInstall.Name = 'buttonTestInstall'
	$buttonTestInstall.Size = New-Object System.Drawing.Size(75, 23)
	$buttonTestInstall.TabIndex = 9
	$buttonTestInstall.Text = 'IPAM'
	$buttonTestInstall.UseVisualStyleBackColor = $True
	#
	# buttonPing
	#
	$buttonPing.Location = New-Object System.Drawing.Point(6, 21)
	$buttonPing.Name = 'buttonPing'
	$buttonPing.Size = New-Object System.Drawing.Size(75, 23)
	$buttonPing.TabIndex = 0
	$buttonPing.Text = 'Ping Site'
	$buttonPing.UseVisualStyleBackColor = $True
	#
	# Pretest
	#
	$Pretest.Controls.Add($buttonSoftware)
	$Pretest.Controls.Add($buttonDrives)
	$Pretest.Controls.Add($buttonNIC)
	$Pretest.Controls.Add($buttonQuery)
	$Pretest.Controls.Add($buttonRDP)
	$Pretest.Controls.Add($buttonLogoff)
	$Pretest.Controls.Add($buttonFolders)
	$Pretest.Controls.Add($buttonPingOD)
	$Pretest.Location = New-Object System.Drawing.Point(4, 22)
	$Pretest.Name = 'Pretest'
	$Pretest.Padding = '3, 3, 3, 3'
	$Pretest.Size = New-Object System.Drawing.Size(277, 107)
	$Pretest.TabIndex = 1
	$Pretest.Text = 'PreTest'
	$Pretest.UseVisualStyleBackColor = $True
	#
	# buttonSoftware
	#
	$buttonSoftware.Location = New-Object System.Drawing.Point(87, 35)
	$buttonSoftware.Name = 'buttonSoftware'
	$buttonSoftware.Size = New-Object System.Drawing.Size(75, 23)
	$buttonSoftware.TabIndex = 11
	$buttonSoftware.Text = 'Software'
	$buttonSoftware.UseVisualStyleBackColor = $True
	#
	# buttonDrives
	#
	$buttonDrives.Location = New-Object System.Drawing.Point(6, 64)
	$buttonDrives.Name = 'buttonDrives'
	$buttonDrives.Size = New-Object System.Drawing.Size(75, 23)
	$buttonDrives.TabIndex = 10
	$buttonDrives.Text = 'Drives'
	$buttonDrives.UseVisualStyleBackColor = $True
	#
	# buttonNIC
	#
	$buttonNIC.Location = New-Object System.Drawing.Point(6, 35)
	$buttonNIC.Name = 'buttonNIC'
	$buttonNIC.Size = New-Object System.Drawing.Size(75, 23)
	$buttonNIC.TabIndex = 9
	$buttonNIC.Text = 'NIC'
	$buttonNIC.UseVisualStyleBackColor = $True
	#
	# buttonQuery
	#
	$buttonQuery.Location = New-Object System.Drawing.Point(6, 6)
	$buttonQuery.Name = 'buttonQuery'
	$buttonQuery.Size = New-Object System.Drawing.Size(75, 23)
	$buttonQuery.TabIndex = 8
	$buttonQuery.Text = 'Query'
	$buttonQuery.UseVisualStyleBackColor = $True
	#
	# buttonRDP
	#
	$buttonRDP.Location = New-Object System.Drawing.Point(168, 35)
	$buttonRDP.Name = 'buttonRDP'
	$buttonRDP.Size = New-Object System.Drawing.Size(75, 23)
	$buttonRDP.TabIndex = 7
	$buttonRDP.Text = 'RDP'
	$buttonRDP.UseVisualStyleBackColor = $True
	#
	# buttonLogoff
	#
	$buttonLogoff.Location = New-Object System.Drawing.Point(168, 6)
	$buttonLogoff.Name = 'buttonLogoff'
	$buttonLogoff.Size = New-Object System.Drawing.Size(75, 23)
	$buttonLogoff.TabIndex = 6
	$buttonLogoff.Text = 'Logoff'
	$buttonLogoff.UseVisualStyleBackColor = $True
	#
	# buttonFolders
	#
	$buttonFolders.Location = New-Object System.Drawing.Point(87, 64)
	$buttonFolders.Name = 'buttonFolders'
	$buttonFolders.Size = New-Object System.Drawing.Size(75, 23)
	$buttonFolders.TabIndex = 5
	$buttonFolders.Text = 'Folders'
	$buttonFolders.UseVisualStyleBackColor = $True
	#
	# buttonPingOD
	#
	$buttonPingOD.Location = New-Object System.Drawing.Point(87, 6)
	$buttonPingOD.Name = 'buttonPingOD'
	$buttonPingOD.Size = New-Object System.Drawing.Size(75, 23)
	$buttonPingOD.TabIndex = 4
	$buttonPingOD.Text = 'Ping OD'
	$buttonPingOD.UseVisualStyleBackColor = $True
	#
	# Exam
	#
	$Exam.Controls.Add($buttonSoftwareExam)
	$Exam.Controls.Add($buttonDrivesExam)
	$Exam.Controls.Add($buttonNICExam)
	$Exam.Controls.Add($buttonQueryExam)
	$Exam.Controls.Add($buttonLogoffExam)
	$Exam.Controls.Add($buttonRDPExam)
	$Exam.Controls.Add($buttonComExam)
	$Exam.Location = New-Object System.Drawing.Point(4, 22)
	$Exam.Name = 'Exam'
	$Exam.Padding = '3, 3, 3, 3'
	$Exam.Size = New-Object System.Drawing.Size(277, 107)
	$Exam.TabIndex = 2
	$Exam.Text = 'Exam'
	$Exam.UseVisualStyleBackColor = $True
	#
	# buttonSoftwareExam
	#
	$buttonSoftwareExam.Location = New-Object System.Drawing.Point(90, 36)
	$buttonSoftwareExam.Name = 'buttonSoftwareExam'
	$buttonSoftwareExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonSoftwareExam.TabIndex = 10
	$buttonSoftwareExam.Text = 'Software'
	$buttonSoftwareExam.UseVisualStyleBackColor = $True
	#
	# buttonDrivesExam
	#
	$buttonDrivesExam.Location = New-Object System.Drawing.Point(6, 65)
	$buttonDrivesExam.Name = 'buttonDrivesExam'
	$buttonDrivesExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonDrivesExam.TabIndex = 9
	$buttonDrivesExam.Text = 'Drives'
	$buttonDrivesExam.UseVisualStyleBackColor = $True
	#
	# buttonNICExam
	#
	$buttonNICExam.Location = New-Object System.Drawing.Point(6, 36)
	$buttonNICExam.Name = 'buttonNICExam'
	$buttonNICExam.Size = New-Object System.Drawing.Size(75, 23)
	$buttonNICExam.TabIndex = 8
	$buttonNICExam.Text = 'NIC'
	$buttonNICExam.UseVisualStyleBackColor = $True
	#
	# buttonQueryExam
	#
	$buttonQueryExam.Location = New-Object System.Drawing.Point(6, 6)
	$buttonQueryExam.Name = 'buttonQueryExam'
	$buttonQueryExam.Size = New-Object System.Drawing.Size(75, 24)
	$buttonQueryExam.TabIndex = 7
	$buttonQueryExam.Text = 'Query'
	$buttonQueryExam.UseVisualStyleBackColor = $True
	#
	# buttonLogoffExam
	#
	$buttonLogoffExam.Location = New-Object System.Drawing.Point(171, 6)
	$buttonLogoffExam.Name = 'buttonLogoffExam'
	$buttonLogoffExam.Size = New-Object System.Drawing.Size(75, 24)
	$buttonLogoffExam.TabIndex = 6
	$buttonLogoffExam.Text = 'Logoff'
	$buttonLogoffExam.UseVisualStyleBackColor = $True
	#
	# buttonRDPExam
	#
	$buttonRDPExam.Location = New-Object System.Drawing.Point(171, 36)
	$buttonRDPExam.Name = 'buttonRDPExam'
	$buttonRDPExam.Size = New-Object System.Drawing.Size(75, 24)
	$buttonRDPExam.TabIndex = 5
	$buttonRDPExam.Text = 'RDP'
	$buttonRDPExam.UseVisualStyleBackColor = $True
	#
	# buttonComExam
	#
	$buttonComExam.Location = New-Object System.Drawing.Point(90, 6)
	$buttonComExam.Name = 'buttonComExam'
	$buttonComExam.Size = New-Object System.Drawing.Size(75, 24)
	$buttonComExam.TabIndex = 4
	$buttonComExam.Text = 'Com'
	$buttonComExam.UseVisualStyleBackColor = $True
	#
	# SiteNumber
	#
	$SiteNumber.Location = New-Object System.Drawing.Point(65, 26)
	$SiteNumber.Name = 'SiteNumber'
	$SiteNumber.Size = New-Object System.Drawing.Size(100, 20)
	$SiteNumber.TabIndex = 4
	#
	# labelWorkstation
	#
	$labelWorkstation.AutoSize = $True
	$labelWorkstation.Location = New-Object System.Drawing.Point(12, 66)
	$labelWorkstation.Name = 'labelWorkstation'
	$labelWorkstation.Size = New-Object System.Drawing.Size(67, 13)
	$labelWorkstation.TabIndex = 3
	$labelWorkstation.Text = 'Workstation:'
	#
	# labelSiteNo
	#
	$labelSiteNo.AutoSize = $True
	$labelSiteNo.Location = New-Object System.Drawing.Point(14, 29)
	$labelSiteNo.Name = 'labelSiteNo'
	$labelSiteNo.Size = New-Object System.Drawing.Size(45, 13)
	$labelSiteNo.TabIndex = 2
	$labelSiteNo.Text = 'Site No.'
	$Tabs.ResumeLayout()
	$General.ResumeLayout()
	$Pretest.ResumeLayout()
	$Exam.ResumeLayout()
	$MainForm.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $MainForm.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$MainForm.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$MainForm.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $MainForm.ShowDialog()

} #End Function

#Call the form
Show-MainForm_psf | Out-Null
