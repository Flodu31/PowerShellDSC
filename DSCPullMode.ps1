Configuration PullMode
{

	param (
		[string]$Computername,
		[string]$Guid
	)
	Node $Computername
	{
	
		LocalConfigurationManager
		{
		
			ConfigurationMode           = 'ApplyOnly'
			ConfigurationID             = $Guid
			RefreshMode                 = 'Pull'
			DownloadManagerName         = 'WebDownloadManager'
			DownloadManagerCustomData   = @{
				ServerUrl               = 'http://dscpulleco01.westeurope.cloudapp.azure.com:8080/PSDSCPullServer.svc'
				AllowUnsecureConnection = 'true'
			}	
		}
	}
}

PullMode -Computername 10.0.1.8 -Guid 8c3fd4c9-9166-45c1-8559-872e431d8902
Set-DSCLocalConfigurationManager -Computer 10.0.1.8 -Path ./PullMode -Verbose