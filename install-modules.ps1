#requires -RunAsAdministrator 
#requires -Version 5.1

#region "SitecoreInstallFramework"
if( (Get-PSRepository -Name SitecoreGallery -ErrorAction SilentlyContinue) -eq $null )
{
    Write-Verbose "Configure SitecoreGallery repository"
    Register-PSRepository -Name SitecoreGallery -SourceLocation https://sitecore.myget.org/F/sc-powershell/api/v2 -InstallationPolicy Trusted
}
  
if( (Get-Module -Name SitecoreInstallFramework -ListAvailable) -eq $null )
{
    #If install-module is not available check https://www.microsoft.com/en-us/download/details.aspx?id=49186
    Install-Module SitecoreInstallFramework -Scope AllUsers -Repository SitecoreGallery
}
else
{
    Write-Verbose "SIF module already installed"
    Update-Module SitecoreInstallFramework -Force
}
#endregion
  
#region "SitecoreFundamentals"
if( (Get-Module -Name SitecoreFundamentals -ListAvailable) -eq $null )
{
    #If install-module is not available check https://www.microsoft.com/en-us/download/details.aspx?id=49186
    Install-Module SitecoreFundamentals -Scope AllUsers -Repository SitecoreGallery
}
else
{
    Write-Verbose "SitecoreFundamentals module already installed"
    Update-Module SitecoreFundamentals -Force
}
#endregion
