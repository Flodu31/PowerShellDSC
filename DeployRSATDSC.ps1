Configuration RSAT
{
	param ($Computername)

	Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

	Node $Computername
	{
		#Install the ADDS RSAT Tools
		WindowsFeature RSAT-ADDS
		{
			Ensure = "Present"
			Name = "RSAT-ADDS"
		}
		
		#Install the RSAT Hyper-V Tools
		WindowsFeature RSAT-Hyper-V-Tools
		{
			Ensure = "Present"
			Name = "RSAT-Hyper-V-Tools"
		}
		
		#Install the RSAT DNS Tool
		WindowsFeature RSAT-DNS-Server
		{
			Ensure = "Present"
			Name = "RSAT-DNS-Server"
		}
	}
}

RSAT -Computername "dscclienteco01.westeurope.cloudapp.azure.com" -OutputPath "C:\Users\florent\Desktop\ClientDSC"