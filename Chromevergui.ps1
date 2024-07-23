Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Chrome Version Checker"
$form.Size = New-Object System.Drawing.Size(400,400)
$form.StartPosition = "CenterScreen"

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Select Workstations:"
$label.Size = New-Object System.Drawing.Size(180,20)
$label.Location = New-Object System.Drawing.Point(10,20)
$form.Controls.Add($label)

# Create a ListBox
$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Size = New-Object System.Drawing.Size(350,150)
$listBox.Location = New-Object System.Drawing.Point(10,50)
$listBox.SelectionMode = [System.Windows.Forms.SelectionMode]::MultiExtended
$form.Controls.Add($listBox)

# Load workstations from the text file
$workstations = Get-Content -Path "workstations.txt"
$listBox.Items.AddRange($workstations)

# Create a button to check the version
$checkButton = New-Object System.Windows.Forms.Button
$checkButton.Text = "Check Version"
$checkButton.Size = New-Object System.Drawing.Size(100,30)
$checkButton.Location = New-Object System.Drawing.Point(80,220)
$form.Controls.Add($checkButton)

# Create a cancel button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "Cancel"
$cancelButton.Size = New-Object System.Drawing.Size(100,30)
$cancelButton.Location = New-Object System.Drawing.Point(220,220)
$form.Controls.Add($cancelButton)

# Create a TextBox to display results
$resultTextBox = New-Object System.Windows.Forms.TextBox
$resultTextBox.Multiline = $true
$resultTextBox.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$resultTextBox.Size = New-Object System.Drawing.Size(350,100)
$resultTextBox.Location = New-Object System.Drawing.Point(10,260)
$form.Controls.Add($resultTextBox)

# Add event handler for the cancel button
$cancelButton.Add_Click({
    $form.Close()
})

# Add event handler for the check version button
$checkButton.Add_Click({
    $selectedWorkstations = $listBox.SelectedItems
    if ($selectedWorkstations.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show("Please select at least one workstation.")
    } else {
        $resultTextBox.Clear()
        foreach ($workstation in $selectedWorkstations) {
            try {
                $chromeVersion = Invoke-Command -ComputerName $workstation -ScriptBlock {
                    (Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Google\Update\Clients\{8A69D345-D564-463C-AFF1-A69D9E530F96}").pv
                }
                $resultTextBox.AppendText("Workstation: $workstation - Google Chrome Version: $chromeVersion`r`n")
            } catch {
                $resultTextBox.AppendText("Failed to retrieve Chrome version for workstation: $workstation. Make sure the workstation name is correct and you have the necessary permissions.`r`n")
            }
        }
    }
})

# Show the form
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
