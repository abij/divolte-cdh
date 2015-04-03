# Add Divolte on Hadoop using Cloudera Manager

1. Create/use a cluster managed with Cloudera Manager.
1. Upgrade cluster to Java8 or install Java8 separate on the host(s) which will be running the Divolte-collector.
1. Build Divolte, and copy the Divolte-collector-x.x.jar into /divolte-parcel/DIVOLTE-x.x/lib/ 
1. Create a parcel and place it in the /opt/cloudera/parcel-repo/
1. Create a csd (CustomServiceDescriptor) and place it in the /opt/cloudera/csd/
1. Use ClouderaManager to distribute and activate the parcel.
1. Add the Divolte service using the wizard.
1. Start collecting!

### Parcel

Cloudera Docs: [https://github.com/cloudera/cm_ext/wiki/Building-a-parcel]

> Validator is created from https://github.com/cloudera/cm_ext/validator.

Create a parcel using the /divolte-parcel/build-parcel.sh script. 
Validate the parcel for errors with the command:

    java -jar ../cm_ext/validator/target/validate.jar DIVOLTE*.parcel

If it's valid you can copy the parcel and the corresponding hash to the directory on cloudera-manager machine in the folder _/opt/cloudera/parcel-repo/_

### Custom Service Descriptor

[https://github.com/cloudera/cm_ext/wiki/CSD-Overview]

Use maven to create a fresh csd file.

    mvn clean package

Copy this jar to /opt/cloudera/csd/. This directory will probably not exist, then create it.
After login into Cloudera-Manager you can check if the parcel is found:
[http://your-cloudera-manager:7180/cmf/csd/refresh]

If there are no errors you can install the Divolte service using the Add Service wizard.