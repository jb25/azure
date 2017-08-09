#include "iothubtransportmqtt.h"
#include "schemalib.h"
#include "iothub_client.h"
#include "serializer_devicetwin.h"
#include "schemaserializer.h"
#include "azure_c_shared_utility/threadapi.h"
#include "azure_c_shared_utility/platform.h"
#include "parson.h"

static const char* deviceId = "pc-jon-linux";
static const char* connectionString = "HostName=conectiontesta4aca.azure-devices.net;DeviceId=pc-jon-linux;SharedAccessKey=RmyKhwoPQyUWCP/PMJEnP03FiRIlj1eZL8UrzRIMKJ4=";

// Define the Model
BEGIN_NAMESPACE(conectiontesta4aca);

/* Reported properties */
DECLARE_STRUCT(SystemProperties,
	       ascii_char_ptr, Manufacturer,
	       ascii_char_ptr, FirmwareVersion,
	       ascii_char_ptr, InstalledRAM,
	       ascii_char_ptr, ModelNumber,
	       ascii_char_ptr, Platform,
	       ascii_char_ptr, Processor,
	       ascii_char_ptr, SerialNumber
	       );

DECLARE_STRUCT(LocationProperties,
	       double, Latitude,
	       double, Longitude
	       );

DECLARE_STRUCT(ReportedDeviceProperties,
	       ascii_char_ptr, DeviceState,
	       LocationProperties, Location
	       );

DECLARE_MODEL(ConfigProperties,
	      WITH_REPORTED_PROPERTY(double, TemperatureMeanValue),
	      WITH_REPORTED_PROPERTY(uint8_t, TelemetryInterval)
	      );

/* Part of DeviceInfo */
DECLARE_STRUCT(DeviceProperties,
	       ascii_char_ptr, DeviceID,
	       _Bool, HubEnabledState
	       );

DECLARE_DEVICETWIN_MODEL(Thermostat,
			 /* Telemetry (temperature, external temperature and humidity) */
			 WITH_DATA(double, Temperature),
			 WITH_DATA(double, ExternalTemperature),
			 WITH_DATA(double, Humidity),
			 WITH_DATA(ascii_char_ptr, DeviceId),

			 /* DeviceInfo */
			 WITH_DATA(ascii_char_ptr, ObjectType),
			 WITH_DATA(_Bool, IsSimulatedDevice),
			 WITH_DATA(ascii_char_ptr, Version),
			 WITH_DATA(DeviceProperties, DeviceProperties),

			 /* Device twin properties */
			 WITH_REPORTED_PROPERTY(ReportedDeviceProperties, Device),
			 WITH_REPORTED_PROPERTY(ConfigProperties, Config),
			 WITH_REPORTED_PROPERTY(SystemProperties, System),

			 WITH_DESIRED_PROPERTY(double, TemperatureMeanValue, onDesiredTemperatureMeanValue),
			 WITH_DESIRED_PROPERTY(uint8_t, TelemetryInterval, onDesiredTelemetryInterval),

			 /* Direct methods implemented by the device */
			 WITH_METHOD(Reboot),
			 WITH_METHOD(InitiateFirmwareUpdate, ascii_char_ptr, FwPackageURI),

			 /* Register direct methods with solution portal */
			 WITH_REPORTED_PROPERTY(ascii_char_ptr_no_quotes, SupportedMethods)
			 );

END_NAMESPACE(conectiontesta4aca);


void onDesiredTemperatureMeanValue(void* argument)
{
  /* By convention 'argument' is of the type of the MODEL */
  Thermostat* thermostat = argument;
  printf("Received a new desired_TemperatureMeanValue = %f\r\n", thermostat->TemperatureMeanValue);

}

void onDesiredTelemetryInterval(void* argument)
{
  /* By convention 'argument' is of the type of the MODEL */
  Thermostat* thermostat = argument;
  printf("Received a new desired_TelemetryInterval = %d\r\n", thermostat->TelemetryInterval);
}




/* Handlers for direct methods */
METHODRETURN_HANDLE Reboot(Thermostat* thermostat)
{
  (void)(thermostat);

  METHODRETURN_HANDLE result = MethodReturn_Create(201, "\"Rebooting\"");
  printf("Received reboot request\r\n");
  return result;
}

METHODRETURN_HANDLE InitiateFirmwareUpdate(Thermostat* thermostat, ascii_char_ptr FwPackageURI)
{
  (void)(thermostat);

  METHODRETURN_HANDLE result = MethodReturn_Create(201, "\"Initiating Firmware Update\"");
  printf("Recieved firmware update request. Use package at: %s\r\n", FwPackageURI);
  return result;
}



/* Send data to IoT Hub */
static void sendMessage(IOTHUB_CLIENT_HANDLE iotHubClientHandle, const unsigned char* buffer, size_t size)
{
  IOTHUB_MESSAGE_HANDLE messageHandle = IoTHubMessage_CreateFromByteArray(buffer, size);
  if (messageHandle == NULL)
    {
      printf("unable to create a new IoTHubMessage\r\n");
    }
  else
    {
      if (IoTHubClient_SendEventAsync(iotHubClientHandle, messageHandle, NULL, NULL) != IOTHUB_CLIENT_OK)
	{
	  printf("failed to hand over the message to IoTHubClient");
	}
      else
	{
	  printf("IoTHubClient accepted the message for delivery\r\n");
	}

      IoTHubMessage_Destroy(messageHandle);
    }
  free((void*)buffer);
}



/* Callback after sending reported properties */
void deviceTwinCallback(int status_code, void* userContextCallback)
{
  (void)(userContextCallback);
  printf("IoTHub: reported properties delivered with status_code = %u\n", status_code);
}


void remote_monitoring_run(void)
{
  if (platform_init() != 0)
    {
      printf("Failed to initialize the platform.\n");
    }
  else
    {
      if (SERIALIZER_REGISTER_NAMESPACE(conectiontesta4aca) == NULL)
	{
	  printf("Unable to SERIALIZER_REGISTER_NAMESPACE\n");
	}
      else
	{
	  IOTHUB_CLIENT_HANDLE iotHubClientHandle = IoTHubClient_CreateFromConnectionString(connectionString, MQTT_Protocol);
	  if (iotHubClientHandle == NULL)
	    {
	      printf("Failure in IoTHubClient_CreateFromConnectionString\n");
	    }
	  else
	    {
#ifdef MBED_BUILD_TIMESTAMP
	      // For mbed add the certificate information
	      if (IoTHubClient_SetOption(iotHubClientHandle, "TrustedCerts", certificates) != IOTHUB_CLIENT_OK)
		{
		  printf("Failed to set option \"TrustedCerts\"\n");
		}
#endif // MBED_BUILD_TIMESTAMP
	      Thermostat* thermostat = IoTHubDeviceTwin_CreateThermostat(iotHubClientHandle);
	      if (thermostat == NULL)
		{
		  printf("Failure in IoTHubDeviceTwin_CreateThermostat\n");
		}
	      else
		{
		  /* Set values for reported properties */
		  thermostat->Config.TemperatureMeanValue = 55.5;
		  thermostat->Config.TelemetryInterval = 3;
		  thermostat->Device.DeviceState = "normal";
		  thermostat->Device.Location.Latitude = 47.642877;
		  thermostat->Device.Location.Longitude = -122.125497;
		  thermostat->System.Manufacturer = "conectiontesta4aca Inc.";
		  thermostat->System.FirmwareVersion = "2.22";
		  thermostat->System.InstalledRAM = "8 MB";
		  thermostat->System.ModelNumber = "DB-14";
		  thermostat->System.Platform = "Plat 9.75";
		  thermostat->System.Processor = "i3-7";
		  thermostat->System.SerialNumber = "SER21";
		  /* Specify the signatures of the supported direct methods */
		  thermostat->SupportedMethods = "{\"Reboot\": \"Reboot the device\", \"InitiateFirmwareUpdate--FwPackageURI-string\": \"Updates device Firmware. Use parameter FwPackageURI to specifiy the URI of the firmware file\"}";

		  /* Send reported properties to IoT Hub */
		  if (IoTHubDeviceTwin_SendReportedStateThermostat(thermostat, deviceTwinCallback, NULL) != IOTHUB_CLIENT_OK)
		    {
		      printf("Failed sending serialized reported state\n");
		    }
		  else
		    {
		      printf("Send DeviceInfo object to IoT Hub at startup\n");

		      thermostat->ObjectType = "DeviceInfo";
		      thermostat->IsSimulatedDevice = 0;
		      thermostat->Version = "1.0";
		      thermostat->DeviceProperties.HubEnabledState = 1;
		      thermostat->DeviceProperties.DeviceID = (char*)deviceId;

		      unsigned char* buffer;
		      size_t bufferSize;

		      if (SERIALIZE(&buffer, &bufferSize, thermostat->ObjectType, thermostat->Version, thermostat->IsSimulatedDevice, thermostat->DeviceProperties) != CODEFIRST_OK)
			{
			  (void)printf("Failed serializing DeviceInfo\n");
			}
		      else
			{
			  sendMessage(iotHubClientHandle, buffer, bufferSize);
			}

		      /* Send telemetry */
		      thermostat->Temperature = 50;
		      thermostat->ExternalTemperature = 55;
		      thermostat->Humidity = 50;
		      thermostat->DeviceId = (char*)deviceId;

		      while (1)
			{
			  unsigned char*buffer;
			  size_t bufferSize;

			  (void)printf("Sending sensor value Temperature = %f, Humidity = %f\n", thermostat->Temperature, thermostat->Humidity);

			  if (SERIALIZE(&buffer, &bufferSize, thermostat->DeviceId, thermostat->Temperature, thermostat->Humidity, thermostat->ExternalTemperature) != CODEFIRST_OK)
			    {
			      (void)printf("Failed sending sensor value\r\n");
			    }
			  else
			    {
			      sendMessage(iotHubClientHandle, buffer, bufferSize);
			    }

			  ThreadAPI_Sleep(1000);
			}

		      IoTHubDeviceTwin_DestroyThermostat(thermostat);
		    }
		}
	      IoTHubClient_Destroy(iotHubClientHandle);
	    }
	  serializer_deinit();
	}
    }
  platform_deinit();
}
